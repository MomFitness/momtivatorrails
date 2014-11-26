class HomeController < ApplicationController
  
  def index
    redirect_to trainer_home_path if current_user.try(:is_trainer?)
  end
  
end
