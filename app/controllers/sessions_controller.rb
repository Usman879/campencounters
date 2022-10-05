# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  protected

  # def after_sign_in_path_for(resource)
  #   return welcome_path if resource.is_a?(User)
  #   return admin_camps_path if resource.is_a?(Admin)
  #   return admin_user_path if resource.is_a?(User) && resource.sign_in_count.eql?(1)
  #   return camp_multi_step_path(:select_camp) if resource.is_a?(User) && resource.sign_in_count.eql?(1)
  # end
end
