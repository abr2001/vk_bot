class CreateApiVkErrorLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :api_vk_error_logs do |t|
      t.string :method
      t.text :response
      t.belongs_to :account, foreign_key: true
      t.timestamps
    end
  end
end
