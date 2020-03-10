class CreateTotalPhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :total_phrases do |t|
      t.text :value
      t.string :part

      t.timestamps
    end
  end
end
