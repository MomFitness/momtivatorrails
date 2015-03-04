class Workout < ActiveRecord::Base
  
  has_many :feedbacks
  has_many :exercises
  has_many :repeat_sequences
  
  belongs_to :mom, foreign_key: "mom_id"
  belongs_to :trainer, foreign_key: "trainer_id"
  belongs_to :goal
  
end
