class Exercise < ActiveRecord::Base
  
  has_many :types
  has_many :require_tools
  has_many :restrictions
  
  belongs_to :workout
  belongs_to :mistake
  belongs_to :user
  
end
