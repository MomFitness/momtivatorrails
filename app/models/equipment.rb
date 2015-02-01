class Equipment < ActiveRecord::Base
  self.table_name = "equipments"
  
  belongs_to :required_tool
  
end
