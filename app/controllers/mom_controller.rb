class MomController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :required_mom
  
  def dashboard
    @workouts = params[:filter] == "all" ? current_user.mom_workouts : current_user.mom_workouts.where(:workout_date => Date.today)
  end
  
end
