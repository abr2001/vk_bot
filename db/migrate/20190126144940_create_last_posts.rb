class CreateLastPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :last_posts do |t|
      t.belongs_to :post_group, foreign_key: true
      t.belongs_to :post, foreign_key: true
      t.belongs_to :account, foreign_key: true

      t.timestamps
    end
    add_index :last_posts, [:post_group_id, :post_id, :account_id], unique: true
  end
end
