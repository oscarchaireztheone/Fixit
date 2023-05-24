
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def working
    list = Rep.where(:working => true)
    @working = list.count

  end
  rescue_from ActionController::RoutingError, with: :render_not_found

  def render_not_found
      render template: 'errors/not_found', status: :not_found
  end
  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |crews_params|
      crews_params.permit(:email)
    end
  end

  def set_user_id
    crew = current_crew ? current_crew : nil #returns the crew object or ni
    @crew = crew.assignable
  end
  def authenticate_token
    authenticate_or_request_with_http_token do |token|
      Crew.exists?(auth_token: token)
    end
  end
end