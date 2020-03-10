class CreateCommentAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_accounts do |t|
      t.integer :owner_id

      t.timestamps
    end
  end
end
