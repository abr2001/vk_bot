class CreateKeyphrases < ActiveRecord::Migration[5.1]
  def change
    create_table :keyphrases do |t|
      t.string :value

      t.timestamps
    end
  end
end
