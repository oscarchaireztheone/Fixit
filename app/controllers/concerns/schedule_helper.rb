SOME_EXAMP_TEMPLATE = "Hello %{name}, this is a sample tempalte"

module ScheduleHelper

	def proximity_search(zip)
		days = Day.where("date >= ?", Date.today)
  		days_with_distance = days.map do |day|
    		slots_with_distance = {}
    		(1..8).each do |slot_number|
      			slot = day.send("slot#{slot_number}")
      			samsungcall = Samsungcall.find_by(id: slot) if slot.present?
				if samsungcall
					distance = calculate_distance(zip, samsungcall.zipcode)
					slots_with_distance[slot_number] = distance
				else
					slots_with_distance[slot_number] = Float::INFINITY
				end
			end
    		sorted_slots = slots_with_distance.sort_by { |slot_number, distance| distance.nil? ? Float::INFINITY : distance }

		    {
		      day: day,
		      slots: sorted_slots
		    }
  		end

  		sorted_days = days_with_distance.sort_by { |d| d[:slots].min_by { |slot_number, distance| distance.nil? ? Float::INFINITY : distance }[1] }
  		return sorted_days
	end


	def available_slots(target_zip, max_distance = 20000)
		# Assuming Day model has a date field and slots are represented by slot1, slot2, ..., slot8 fields
		available_days = Day.where('date > ?', Date.today + 2.days )

		slot_distances = []

		available_days.each do |day|
    		(1..8).each do |slot_number|

	      		if (day["slot#{slot_number}"].nil?) && ((!day["slot#{slot_number + 1}"].nil?) || (!day["slot#{slot_number - 1}"].nil?))
	        		zip1 = target_zip
	        		zip2 = day["slot#{slot_number + 1}"] || day["slot#{slot_number - 1}"] 
	        		zip2 = Samsungcall.find(zip2).zipcode
	        		distance = calculate_distance(zip1, zip2)
	        		slot_distances << { slot: slot_number, distance: distance, date: day.date} if distance <= max_distance
	        		Rails.logger.warn(" hererrrr")
	        		Rails.logger.warn(slot_distances)
	        		slot_distances
	      		end
    		end
  		end
		
		if slot_distances.length <= 1 && max_distance > 20000   # get extra slots if the distance has already been increased
		  days_holder = get_days_with_available_slots
		  Rails.logger.warn("we")
			Rails.logger.warn(slot_distances)
		  slot_distances = create_slot_distances_2(days_holder, slot_distances)
		  Rails.logger.warn("inside the first if")
		  Rails.logger.warn(slot_distances)
		else
			Rails.logger.warn("we had data")
			Rails.logger.warn(slot_distances)

		  	slot_distances
		end
		# Sort slot_distances by distance in ascending order
		slot_distances.sort_by! { |slot_distance| slot_distance[:distance] }
		slot_distances[...8]

	end

	def get_days_with_available_slots
	  start_date = Date.today + 2.days
	  available_days = []
	  
	  while available_days.size < 2
	    # Skip the day if it's a Sunday
	    if start_date.wday == 0
	      start_date = start_date + 1.day
	      next
	    end

	    current_day = Day.find_by(date: start_date)

	    # If Day where date is start_date does not exist, create a new Day and assign it to current_day
	    if current_day.nil?
	      current_day = Day.create(date: start_date)
	    end

	    available_slots = [current_day.slot1, current_day.slot2, current_day.slot3, current_day.slot4, current_day.slot5, current_day.slot6, current_day.slot7, current_day.slot8].count(nil)
	    if available_slots >= 5
	      available_days << current_day
	    end

	    start_date = start_date + 1.day
	  end

	  # If two days with at least 5 available slots each cannot be found, return false
	  return false if available_days.size < 2

	  available_days
	end

	def create_slot_distances_2(days, slotsA)
	  slot_distances = slotsA
	  recent_days = days
	  recent_days.each do |day|
	    (1..8).each do |slot_number|
	      if day.send("slot#{slot_number}").nil?
	        distance = 0
	        # Construct the slot_distance hash and add it to the slot_distances array
	        slot_distances << { slot: slot_number, distance: distance, date: day.date }
	      end
	    end
	  end

	  # Return the slot_distances array
	  slot_distances
	end
	def calculate_distance(zip1, zip2)
	    return Float::INFINITY if zip1.nil? || zip2.nil?
	    api_key = ENV['GMAP_API_KEY']
	    uri = URI("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{zip1}&destinations=#{zip2}&key=#{api_key}")
	    response = Net::HTTP.get(uri)
	    result = JSON.parse(response)
	    distance = result['rows'][0]['elements'][0]['distance']['value'] if result['status'] == 'OK'
	    distance || Float::INFINITY
 	end

end