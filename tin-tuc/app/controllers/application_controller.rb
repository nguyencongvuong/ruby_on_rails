class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # include SessionHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
	  def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
	    user_params.permit!
	  end
	end
end
