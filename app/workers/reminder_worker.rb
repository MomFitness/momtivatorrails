class ReminderWorker
  include Sidekiq::Worker

  def perform(args)
    workout = Workout.find(args['id'])
    Pusher.trigger("private-#{workout.mom.id}", "reminder_12345", {notification_text: "Reminder: #{workout.name}"})
  end
end
