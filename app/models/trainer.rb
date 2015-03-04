class Trainer < User
  
  has_many :workouts
  
  def self.default_scope
    where(["role = ?", "Trainer"])
  end
  
  def full_name
    "#{self.profile.first_name} #{self.profile.last_name}"
  end
  
end
