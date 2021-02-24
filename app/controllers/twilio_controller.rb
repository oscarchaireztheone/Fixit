class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token


  def voice

   num = Rep.find_by working: true 

   if num != nil

  	response = Twilio::TwiML::VoiceResponse.new do |r|
  		  r.say(message: ' greeting message', voice: 'alice')
  		  r.dial(caller_id: '+15037828100') do |dial|
  		  	dial.number(num.pnum)
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
