class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token


   def voice
    #get a list of all the working agents
    
    Customer.create({:name => 'Missing',  :phone1 => params[:Caller], :phone2 => 'Ask', :email => 'ASK', :address => params[:FromCity]})
   agents =  Agent.where(working: true).order('created_at DESC')
   num = agents.sample

   if num != nil

    response = Twilio::TwiML::VoiceResponse.new do |r|
        r.say(message: 'please wait', voice: 'alice')
        r.dial(caller_id: ENV['TWILIO_PHONE_NUMBER']) do |dial|
          dial.number(num.phone)
        end
      end
    else

      response = Twilio::TwiML::VoiceResponse.new do |r|
        r.say(message: ' Sorry Our office are closed, please schedule an appointment on our online portal under schedule a call, Good bye', voice: 'alice')
      end

    end

          render xml: response.to_s
  end

end
