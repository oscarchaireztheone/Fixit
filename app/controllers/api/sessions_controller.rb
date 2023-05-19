class Api::SessionsController < ApplicationController
skip_before_action :verify_authenticity_token

  def create
    crew = Crew.find_by(email: params[:email])

    if crew&.valid_password?(params[:password])
      # Generate a new authentication token
      token = crew.generate_auth_token

      # Save the crew with the new token
      Rails.logger.warn("inside creat function in crew.rb")
      Rails.logger.warn(token)
      Rails.logger.warn(crew.auth_token)
      if crew.save
        Rails.logger.warn(crew.auth_token)
        # Return the token in the response
        render json: { token: token }
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
