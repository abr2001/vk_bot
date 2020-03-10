class AddSortToPhrase < ActiveRecord::Migration[5.1]
  def change
    add_column :phrases, :sort, :integer
  end
end
