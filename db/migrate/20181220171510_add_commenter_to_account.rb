class AddCommenterToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :commenter, :boolean
  end
end
