class Feedback < ActiveRecord::Base
  
  belongs_to :mom
  belongs_to :workout
  has_attached_file :workout_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :workout_picture, :content_type => /\Aimage\/.*\Z/
end
