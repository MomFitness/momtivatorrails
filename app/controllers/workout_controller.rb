class WorkoutController < ApplicationController
  
  before_filter :get_workout, :only => [:show]
  
  def show
    
  end

  def preview
    @workout = Workout.find(params[:workout_id])
    respond_to do |format|
      format.js
    end
  end

  private
  
  def get_workout
    @workout = Workout.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = 'Workout not found.'
    redirect_to root_path
    return false
  end

end
