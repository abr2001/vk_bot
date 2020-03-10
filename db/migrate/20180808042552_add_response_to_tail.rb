class AddResponseToTail < ActiveRecord::Migration[5.1]
  def change
    add_column :tails, :response, :text
  end
end
