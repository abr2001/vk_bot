class CreatePostGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :post_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
