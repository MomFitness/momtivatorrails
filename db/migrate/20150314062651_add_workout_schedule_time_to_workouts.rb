class AddWorkoutScheduleTimeToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :workout_schedule_time, :string, :limit => 10, :null => true
  end
end
