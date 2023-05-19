class ApiHtmlController < ApplicationController
	before_action :set_manager
	before_action :authenticate_crew!, except: :portal
  	before_action :set_user_id, except: :portal
	include ScheduleHelper
  	def portal
	  	@sc = Samsungcall.find_by_fourk(params_params[:id])
	  	@appointment = @service_manager.check_for_appointment(@sc.id)
	  	if !@appointment
		    @data = @service_manager.fetch_data(@sc)
		end
		render "portal"
	end

  	def dashboard
  		@crew      #defined in the application.rb controller
 	end

  	def techschedule
 	end

  	def makecall
 	end

	private
    # Only allow a list of trusted parameters through.
	def params_params
	  params.permit(:id)
	end
	def set_manager
		@service_manager = Api::ServiceManagerController.new
	end
end
