class AddAttachmentWorkoutPictureToFeedbacks < ActiveRecord::Migration
  def self.up
    change_table :feedbacks do |t|
      t.attachment :workout_picture
    end
  end

  def self.down
    remove_attachment :feedbacks, :workout_picture
  end
end
