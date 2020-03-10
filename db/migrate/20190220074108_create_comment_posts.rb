class CreateCommentPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_posts do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :owner_id
      t.integer :post_id

      t.timestamps
    end
  end
end
