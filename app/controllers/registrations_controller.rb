class RegistrationsController < Devise::RegistrationsController
 
  private
  # Overriding so registrations controller allows for different user types
  def sign_up_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation, :current_password)
  end
end
