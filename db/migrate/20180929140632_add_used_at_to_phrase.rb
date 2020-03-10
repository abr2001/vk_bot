class AddUsedAtToPhrase < ActiveRecord::Migration[5.1]
  def change
    add_column :phrases, :used_at, :datetime
  end
end
