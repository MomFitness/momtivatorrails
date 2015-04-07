class Exercise < ActiveRecord::Base
  
  has_many :types
  has_many :require_tools
  has_many :restrictions
  
  has_and_belongs_to_many :mistakes
  belongs_to :goal
  belongs_to :user
  
end
