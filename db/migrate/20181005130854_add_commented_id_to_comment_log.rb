class AddCommentedIdToCommentLog < ActiveRecord::Migration[5.1]
  def change
    add_column :comment_logs, :commented_id, :integer
  end
end
