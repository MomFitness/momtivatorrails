class Workout < ActiveRecord::Base
  
  has_many :feedbacks
  has_many :exercises
  has_many :repeat_sequences
  
  belongs_to :mom
  belongs_to :trainer
  belongs_to :goal
  
end
