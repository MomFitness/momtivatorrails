class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
          
  def self.roles
    ["Admin", "Mom", "Trainer"]
  end
  
  self.roles.each do | method |
    define_method "is_#{method.downcase}?" do
      self.role == method
    end
  end
  
end
