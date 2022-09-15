class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    return admin_camps_path if resource.is_a?(Admin)
    return root_path if resource.is_a?(User) && resource.sign_in_count.eql?(1)
  end
end
