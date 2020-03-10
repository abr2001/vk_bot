class AddUserTokenVk < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :token_vk, :string
  end
end
