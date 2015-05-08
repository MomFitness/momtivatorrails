class FeedbackController < ApplicationController

  before_filter :get_workout, :only => [:new, :create]

  def new
  end

  def create
    @feedback = Feedback.new( feedback_params )
    @feedback.workout = @workout
    @feedback.save!
    render :action => :show
  end

  def show
  end

  private
  
  def feedback_params
    # How can I pass workout_id into permit so I can do
    # Feedback.create(feedback_params)?
    params.require(:feedback).permit(:workout_picture)
  end

  def get_workout
    @workout = Workout.find(params[:workout_id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = 'Workout not found.'
    redirect_to root_path
    return false
  end
end