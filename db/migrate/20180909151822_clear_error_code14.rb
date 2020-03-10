class ClearErrorCode14 < ActiveRecord::Migration[5.1]
  def change
    Tail.where(error_code: 14).update_all(error_code: nil)
  end
end
