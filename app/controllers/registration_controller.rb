# frozen_string_literal: true

#
# Missing top-level documentation
#
class RegistrationController < Devise::RegistrationsController
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:agreement, :first_name, :last_name, :country, :phone_number, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :country, :phone_number, :email, :password, :current_password)
    end
  end
end
