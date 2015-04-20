class WorkoutController < ApplicationController
  
  before_filter :get_workout, :only => [:show, :update]
  
  def show
    @squences_duration = Hash.new()
    @workout.expended_repeat_sequences.map do |s|
      @squences_duration["#{s.new_order}.#{s.exercise.name}"] = s.duration
    end
    if @timer_seq = @workout.timer.blank? ? nil : JSON.parse(@workout.timer.gsub("\\", ""))
      @arry_timer_seq = timer_current_seq = @timer_seq.keys[0].split(".")
      puts "@arry_timer_seq before ===> #{@arry_timer_seq.inspect}"
      timer_current_seq.shift
      @seq_workout = @workout.sequences.find_by(exercise: Exercise.find_by(name: timer_current_seq.join('.').lstrip))
      puts "@arry_timer_seq after ===> #{@arry_timer_seq.inspect}"
      puts "@seq_workout ===> #{@seq_workout.inspect}"
    end
  end
  
  def update
    @workout.update(permitted_params["workout"])
    redirect_to mom_workout_path(@workout)
  end
  
  
  private
  
  def get_workout
    @workout = Workout.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.alert = 'Workout not found.'
    redirect_to root_path
    return false
  end
  
  def permitted_params
    params.permit(:utf8, :_method, :id, :workout => [:status, :timer])
  end

end
