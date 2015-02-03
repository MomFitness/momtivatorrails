class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, :dependent => :destroy
  has_many :feedbacks
  has_many :workouts
  has_many :exercise_instructions
  has_many :exercises
  
          
  def self.roles
    ["Admin", "Mom", "Trainer"]
  end
  
  self.roles.each do | method |
    define_method "is_#{method.downcase}?" do
      self.role == method
    end
  end
  
end
