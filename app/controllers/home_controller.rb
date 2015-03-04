class HomeController < ApplicationController
  
  def index
    redirect_to trainer_home_path if current_user.try(:is_trainer?)
    redirect_to mom_home_path if current_user.try(:is_mom?)
  end
  
end
