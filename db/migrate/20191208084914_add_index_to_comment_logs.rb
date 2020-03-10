class AddIndexToCommentLogs < ActiveRecord::Migration[5.1]
  def change
    add_index :comment_logs, :post_id
    add_index :comment_logs, [:post_id, :comment_id]
  end
end
