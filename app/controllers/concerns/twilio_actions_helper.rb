

AUTO_SCHEDULE_TEMPLATE = 'Hello %{name}, This is the Appliance2020 automated appoinment 
scheduler. Click the link below to be directed to our web portal where you can select an
appointment slots for your appliance repair."%{link}", This is easier on us and faster for you'
AERT_TECH_TEMPLATE = 'Appointment %{name}: %{time} Confirmed'

module TwilioActionsHelper
  TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
	TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
	TWILIO_PHONE_NUMBER = ENV['TWILIO_PHONE_NUMBER']

  	def send_auto_scheduler(to, variables)
  		body = AUTO_SCHEDULE_TEMPLATE % variables
      client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
		  client.messages.create(
      	body: body,
      	to: to,
      	from: TWILIO_PHONE_NUMBER
    	)
  	end

    def send_tech_alert(variables, to= ENV['MYNUM'])
      body = AERT_TECH_TEMPLATE % variables
      client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
      client.messages.create(
        body: body,
        to: to,
        from: TWILIO_PHONE_NUMBER
      )
    end
end