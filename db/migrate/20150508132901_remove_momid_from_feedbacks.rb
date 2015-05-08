class RemoveMomidFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :mom_id, :int
  end
end
