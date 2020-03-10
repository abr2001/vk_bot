class AddIndexToTail < ActiveRecord::Migration[5.1]
  def change
    add_index :tails, [:friend_id, :user_id]
  end
end
