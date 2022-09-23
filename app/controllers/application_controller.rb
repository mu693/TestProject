class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pagy::Backend
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def ensure_current_user
    if current_user.nil?
      redirect_to "/"
    end  
  end  
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :lname, :avatar)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :lname, :avatar, :email, :password, :current_password)}
  end
end
