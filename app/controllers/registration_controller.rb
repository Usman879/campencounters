class RegistrationController < Devise::RegistrationsController
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

def index
end
 
protected

def configure_permitted_parameters
  # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :country, :phone_number, :password])
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :country, :phone_number, :email, :password) }
  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :country, :phone_number, :email, :password, :current_password) }
end

end
