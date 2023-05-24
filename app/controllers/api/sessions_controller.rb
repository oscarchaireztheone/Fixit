class Api::SessionsController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    crew = Crew.find_by(email: params[:email])

    if crew&.valid_password?(params[:password])
      # Generate a new authentication token
      token = crew.generate_auth_token
      agent = crew.assignable
      if crew.save
        # Return the token in the response
        Rails.logger.warn("Here is the agrrrrrrrrrrrent#{agent}")
        render json: { token: token, agent: {id: agent.id, name: agent.name, phone: agent.phone}}

      else
        # Handle save error here, perhaps return a 500 status
        render json: { error: 'Could not save crew' }, status: :internal_server_error
      end
    else
      # Return an error response
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
