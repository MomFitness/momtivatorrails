class MomController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :required_mom
  before_filter :get_workout, :only => [:update]
  
  def dashboard
    @workouts = params[:filter] && params[:filter] == "all" ? current_user.mom_workouts : current_user.mom_workouts.where(:workout_date => Date.today)
  end
  
  def update
    @workout.update(permitted_params["workout"])
    redirect_to mom_home_path
  end
  
  private
  
  def get_workout
    @workout = current_user.mom_workouts.find(params[:workout_id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = 'Workout not found.'
    redirect_to mom_home_path
    return false
  end
  
  def permitted_params
    params.permit(:utf8, :_method, :workout_id, :workout => [:workout_schedule_time])
  end
end
