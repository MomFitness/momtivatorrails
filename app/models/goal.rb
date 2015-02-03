class Goal < ActiveRecord::Base
  
  has_many :workouts
  has_many :exercises
  
  belongs_to :type
  
end
