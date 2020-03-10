class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :token
      t.belongs_to :user, foreign_key: true
      t.string :provider
      t.string :code
      t.string :comment

      t.timestamps
    end
  end
end
