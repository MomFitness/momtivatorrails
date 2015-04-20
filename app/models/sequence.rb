class Sequence < ActiveRecord::Base
  
  belongs_to :workout
  belongs_to :exercise
  belongs_to :repeat_sequence
  
  attr_accessor :new_order
  
end
