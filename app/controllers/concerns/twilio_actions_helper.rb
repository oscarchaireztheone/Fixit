

AUTO_SCHEDULE_TEMPLATE = 'Hello %{name}, this is the Appliance 2020 automated appoinment 
scheduler. click the link below and you will be directed to our web portal where you can select an availble
appointment slots for your appliance repair. Alternatively, you wait untill Tuesday or Thursday between for 
one of out team members to contact you about setting up an appoinment. Thank you. "%{link}"'
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

    def send_tech_alert(to= ENV['MYNUM'], variables)
      body = AERT_TECH_TEMPLATE % variables
      client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
      client.messages.create(
        body: body,
        to: to,
        from: TWILIO_PHONE_NUMBER
      )
    end
end