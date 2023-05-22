class TwilioActionsController < ApplicationController
	include TwilioActionsHelper
	##
	## Im not setting the authenticate_token action here because i dont think that i need it.
	## Only authenticating crew and set user for index because thats the only view that i have
	##
	before_action :set_twilio_client
	before_action :authenticate_crew!, only: [:index]
  	before_action :set_user_id, only: [:index]
	skip_before_action :verify_authenticity_token
	TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
	TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
	TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']
	TWILNUM = ENV['TWILNUM']
	MYNUM = ENV['MYNUM']
	CONNAME = ENV['CONNAME']
	API_BASE_URL = ENV['API_BASE_URL']

	def index
		@open_calls = @client.calls.list(status: 'in-progress')

	end

	def create
	end

	def start_conference_call
		
		phone = current_crew.assignable.phone
		Rails.logger.warn(" Cureent crew is here#{current_crew}")
		call = @client.calls.create(
		url: "http://twimlets.com/conference?Name=#{CONNAME}",
		to: phone,
		from: TWILIO_PHONE_NUMBER
		)
    	render json: { message: 'connected to the conference.'}
	end
	

	def join_conference
    conference_name = CONNAME # Replace with the name of your conference

    twiml = Twilio::TwiML::VoiceResponse.new do |response|
      response.dial do |dial|
        dial.conference(conference_name)
      end
    end

    	render xml: twiml.to_s
 	end

	def initiate_call_and_join_conference()
		from_phone_number = TWILIO_PHONE_NUMBER
		phone2 = params[:to]
		to_phone_number = current_crew.assignable.phone

		@call = @client.calls.create(
		url: "#{API_BASE_URL}/dial?to=#{phone2}",
		to: to_phone_number,
		from: from_phone_number
		)
		session[:call_sid1] = @call.sid
    	render json: { message: 'Call initiated and connected to the conference.', call_sid: @call.sid }
	end
	def dial 
		  number = params[:to]

		  twiml = Twilio::TwiML::VoiceResponse.new do |response|
		    response.dial do |dial|
		      dial.number(number)
		    end
		  end

		  render xml: twiml.to_s
		end


	def send_text
		to_number = params[:to]
		body = params[:body]
		@client.messages.create(
			body: body,
			to: to_number,
			from: TWILIO_PHONE_NUMBER
			
		)
    flash[:notice] = "Text message sent successfully."
    redirect_to twilio_actions_path
	end

	def disconnect_call
		@call_sid1 = session[:call_sid1]

	    @client.calls(@call_sid1).update(status: 'completed')

	    render json: { message: 'Call terminated.', call_sid1: @call_sid1 }
	    # call_sid = params[:call_sid]
	    # @client.calls(call_sid).update(status: 'completed')
	    # flash[:notice] = "Call disconnected successfully."
	    # render json: { message: 'Call disconnected.' }
	end

	# def make_call
	# 	to_number = params[:to]
	# 	@client.calls.create(
	# 	url: '#{BASEURL}/twilio_actions/twiml',
	# 	to: to_number,
	# 	from: TWILIO_PHONE_NUMBER
	# 	)
	# 	flash[:notice] = "Call initiated successfully."
	# 	redirect_to twilio_actions_path
	# end

	private

	def set_twilio_client
	@client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
	end

end
