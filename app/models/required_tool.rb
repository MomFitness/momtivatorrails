class RequiredTool < ActiveRecord::Base
  
  belongs_to :exercise
  
  has_many :equipments
  
end
