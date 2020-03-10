class AddSexToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :sex, :integer, default: 0
  end
end
