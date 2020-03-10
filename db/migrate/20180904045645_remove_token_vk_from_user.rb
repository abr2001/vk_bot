class RemoveTokenVkFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :token_vk
  end
end
