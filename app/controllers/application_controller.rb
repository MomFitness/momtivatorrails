class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:role, :email, :password, :password_confirmation, :current_password) }
  end
  
  def required_trainer
    redirect_to root_url, :alert => "Access denied." unless current_user.is_trainer?
  end
  
  def required_mom
    redirect_to root_url, :alert => "Access denied." unless current_user.is_mom?
  end
  
end
