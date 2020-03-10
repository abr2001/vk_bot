class CreatePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :phrases do |t|
      t.text :value
      t.belongs_to :keyphrase, foreign_key: true

      t.timestamps
    end
  end
end
