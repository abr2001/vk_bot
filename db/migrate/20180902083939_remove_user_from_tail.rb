class RemoveUserFromTail < ActiveRecord::Migration[5.1]
  def change
    remove_column :tails, :user_id
  end
end
