class AddInfoToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :info, :text
  end
end
