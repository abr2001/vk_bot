class AddAccountToTail < ActiveRecord::Migration[5.1]
  def change
    add_reference :tails, :account, foreign_key: true
  end
end
