class AddIndexToCommentLog < ActiveRecord::Migration[5.1]
  def change
    add_index :comment_logs, [:owner_id, :post_id, :account_id]
  end
end
