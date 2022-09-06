class RegistrationController < Devise::RegistrationController
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 
protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up).push { |u| u.permit(:first_name, :last_name, :country, :phone_number, :email, :password) }
  devise_parameter_sanitizer.permit(:account_update).push { |u| u.permit(:first_name, :last_name, :country, :phone_number, :email, :password, :current_password) }
end

end
