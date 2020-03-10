class CreateTails < ActiveRecord::Migration[5.1]
  def change
    create_table :tails do |t|
      t.integer :friend_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
