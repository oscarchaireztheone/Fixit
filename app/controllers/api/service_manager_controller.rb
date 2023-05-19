require 'net/http'
require 'json'

class Api::ServiceManagerController < ApplicationController
	include ScheduleHelper
	include TwilioActionsHelper
	include StatusHelper
	skip_before_action :verify_authenticity_token
	API_BASE_URL = ENV["API_BASE_URL"]

	def close_call 
		@samsungcall = Samsungcall.find(params[:id])
		@samsungcall.update(status: 100)
		@samsungcalls = Samsungcall.where("status <= ?", 99)
		render json: {samsungcalls: @samsungcalls, samsungcall: @samsungcall }, status: :ok 
	end

	def rescheduleCallAvailableSlots
		@samsungcall = Samsungcall.find(params[:id]) 
		@slots = fetch_data(@samsungcall)		#{ slot: slot_number, distance: distance, date: day.date}
		render json: { samsungcall: @samsungcall, slots: @slots  }, status: :ok 
	end

	def sync_complete
		@note = Note.find(params[:id])
		new_status = "50"
		# Rails.logger.warn(@note)
		# Rails.logger.warn(@note_params)
		if @note.update(note_content: note_params[:note_content], status: new_status)
			render json: @note, status: :ok 
		else
			render json: { status: :unprocessable_entity }
		end
	end


	def sync_kick_back #color change is just set so that even status are even odd are green no meaning behind that
		@note = Note.find(params[:id])
		new_status = (@note.status.to_i + 1).to_s
		# Rails.logger.warn(@note)
		# Rails.logger.warn(@note_params)
		if (new_status.to_i < 50) 
			if @note.update(note_content: note_params[:note_content], status: new_status.to_s)
				render json: @note, status: :ok 
			else
				render json: { status: :unprocessable_entity }
			end
		
		else
			Rails.logger.warn(" wont fail if you are trying to update beyond 50.")
			render json: @note, status: :ok 
		end

	end

	def fetch_data(samsungcall)
		slot_data = available_slots(samsungcall.zipcode)
		if slot_data.length <= 1
			slot_data = available_slots(samsungcall.zipcode, 25000)
		end
	    return slot_data
	end

	def inner_notes
		@note = Note.new(note_params)
		Rails.logger.warn("*****************")
		Rails.logger.warn(note_params)

  		if @note.save
    		render json: { status: "ok" }
  		else
  			Rails.logger.warn(@note.errors.full_messages)
     		render json: { status: :unprocessable_entity }
  		end

	end
	def view_not_scheduled
		@samsungcalls  = Samsungcall.where("day_id IS NULL")
		render json: @samsungcalls
	end

	def view_open
		@samsungcalls = Samsungcall.where("status <= ?", 99)
		render json: @samsungcalls
	end
	def view_sync
		even_call_ids = Note.where("cast(status as int) >= 10 AND cast(status as int) < 50")
	           .where("cast(status as int) % 2 = 0")
	           .where.not(call_id: nil)
	           .pluck(:call_id)
	           .uniq
		@samsungcalls = Samsungcall.where(id: even_call_ids).where('status < ?', 100)
		render json: @samsungcalls
	end


	def view_all
		@samsungcalls = Samsungcall.where("status <= ?", 99)
		render json: @samsungcalls
	end

	def view_by_tech
		@days = Day.where("date >= ?", Date.today)
		render json: @days
	end
	
	def get_day
	  @day = Day.find(params[:id])

	  day_json = { date: @day.date }

	  (1..8).each do |slot_number|
	    id = @day["slot#{slot_number}"]
	    if id.present?
	      sc = Samsungcall.find(id)
	      day_json["slot#{slot_number}"] = sc.as_json
	    end
	  end
		Rails.logger.warn "looooooo #{day_json}"
	  	render json: day_json
	end


	def modal
 		@samsungcall = Samsungcall.find(params[:id])
		@notes = Note.where(call_id: params[:id])
	  	render json: { samsungcall: @samsungcall, notes: @notes }, status: :ok
	end

		
	def check_for_appointment(id)    # This code is used in the portal action to see if the customer already has an appointment in the syste.
		# Incases where we send a portal text to two people and they both try to make an appointment
		days = Day.where("date >= ?", Date.today)

		days.each do |day|
			slots = (1..8).map { |i| "slot#{i}" }

			slots.each do |slot|
				if day.send(slot) == id
	  				return {slot: slot, date: day.date}
				end
			end
		end

		return false
	end


	def make_appointment
		day = Day.find_by_date(params[:day_date])
		slot = params[:slot]
		samsung_call_id = params[:samsungCall_id]
		sCall = Samsungcall.find(samsung_call_id)
		pLoad = {
			category: 1,
			call_id: sCall.id,
			slot: friendly_slot_name(slot),
			date: params[:day_date],
			name: sCall.name,
			link: "Link2Folow",
			number: sCall.phone1
		}
		if day.update(slot => samsung_call_id)
			stat = combine_integers(sCall.status, 1)
			sCall.update(status: stat)
			render json: { status: "ok" }
			sCall.update(day_id: day.id)
			alert_tech_appointment(pLoad)
			system_note(pLoad)
		else
			Rails.logger.warn "From withing the update"
			render json: { status: :unprocessable_entity }
		end
	end

	def system_note(payload)
		content = note_cat_dictionary(payload[:category])
		note_data = {
			note_content: content,
			phone_number: ENV['TWILIO_PHONE_NUMBER'],
			call_id: payload[:call_id],
			status: "6"
		}
		note = Note.create(note_data)
	end


	def alert_tech_appointment(payload)
		time = payload[:slot]+" "+payload[:date]
		variables = {
			name: payload[:name],
			time: time,
			link: "link be buil later fool"
		}

		send_tech_alert(payload[:number], variables)
		send_tech_alert(variables)  #from twilio_actions_helper in concerns
	end

	def auto_schedule
		set_samsungcall
		if @samsungcall
			if @samsungcall.update(status: 1)
				full_name = @samsungcall.name
				name_parts = full_name.split
				if name_parts.length > 1
				  formatted_name = "#{name_parts[0]} #{name_parts[1][0]}."
				else
				  formatted_name = full_name
				end
				vars = {
					name: formatted_name,
					link: "#{API_BASE_URL}/Appointment_Portal?id=#{@samsungcall.fourk}"
					}
				[@samsungcall.phone1, @samsungcall.phone2].compact.each do |phone|
					if phone != "none"
						send_auto_scheduler(phone, vars)
					end
				end
				render json: @samsungcall, status: :ok
			else
				render json: @samsungcall.errors, status: :unprocessable_entity
			end
		end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	def set_samsungcall
		@samsungcall = Samsungcall.find(params_params[:id])
	end
	def friendly_slot_name(slot)
		slot_mappings = {
		'slot1' => '8am - 10am',
		'slot2' => '9am - 11am',
		'slot3' => '10am - 12pm',
		'slot4' => '11am - 1pm',
		'slot5' => '12pm - 2pm',
		'slot6' => '1pm - 4pm',
		'slot7' => '2pm - 5pm',
		'slot8' => '3pm - 6pm'
		}

		slot_mappings[slot] || slot
	end
	def note_cat_dictionary(cat)
		category_mappings = {
		1 => 'Auto Appointment Success',
		2 => 'Some other System message'
		}

		category_mappings[cat] || slot
	end

	  # Only allow a list of trusted parameters through.
	def params_params
		params.permit(:id)
	end
	def note_params
  		params.require(:note).permit(:note_content, :status, :call_id, :phone_number) # add any other attributes you want to allow
	end


end
