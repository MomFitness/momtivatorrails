class Workout < ActiveRecord::Base
  
  has_many :feedbacks
  has_many :sequences, -> { order(order: :asc) }
  has_many :repeat_sequences
  
  belongs_to :mom, foreign_key: "mom_id"
  belongs_to :trainer, foreign_key: "trainer_id"
  belongs_to :goal
  
  after_save do
    if self.workout_schedule_time_changed? || self.workout_date_changed?
      if self.workout_schedule_time
        remove_sidekiq_job
        add_sidekiq_job
      else
      end
    end
  end
  
  before_destroy :remove_sidekiq_job

  def add_sidekiq_job
    rw_id = ReminderWorker.perform_at(scheduled_at, {id: self.id.to_s})
    self.update_column(:job_id, rw_id)
  end

  def remove_sidekiq_job
    queue = Sidekiq::ScheduledSet.new
    job = queue.find_job(self.job_id)
    job.delete if job
  end

  def scheduled_at
    workout_date_time = self.workout_date.to_s + " " + self.workout_schedule_time
    # workout_date_time.to_i - Time.now.to_i - 2.hours
    workout_date_time.to_time - 5.minutes
  end
end
