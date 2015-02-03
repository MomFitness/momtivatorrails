class Type < ActiveRecord::Base
  
  belongs_to :exercise
  has_many :types
  
end
