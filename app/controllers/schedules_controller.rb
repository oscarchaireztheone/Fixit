class SchedulesController < ApplicationController
  include ScheduleHelper
  before_action :authenticate_crew!, only: [:index]
  before_action :set_user_id, only: [:index]
	
  require 'net/http'

  def index
  end
  

  # API function to return Days and available slots
  def available_slots
    days = Day.where("date >= ?", Date.today)
    available_slots = days.map do |day|
      {
        day: day,
        slots: (1..8).map { |i| "slot#{i}" }.select { |slot| day[slot].nil? }
      }
    end
    render json: available_slots
  end

  # API function to return a list of days ordered by their proximity to the provided zip code
 def days_by_proximity
  target_zip = params[:zip]

  sorted_days = proximity_search(target_zip)

  render json: sorted_days
end



   
  
end
