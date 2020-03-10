class CreateCommentLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_logs do |t|
      t.integer :owner_id
      t.integer :post_id
      t.belongs_to :account, foreign_key: true
      t.integer :comment_id

      t.timestamps
    end
  end
end
