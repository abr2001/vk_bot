class AddErrorCodeToApiVkErrorLog < ActiveRecord::Migration[5.1]
  def change
    add_column :api_vk_error_logs, :error_code, :string
  end
end
