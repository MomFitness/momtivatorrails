class Mom < User
  
  has_many :workouts
  
  def self.default_scope
    where(["role = ?", "Mom"])
  end
  
end
