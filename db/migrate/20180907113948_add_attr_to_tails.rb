class AddAttrToTails < ActiveRecord::Migration[5.1]
  def change
    add_column :tails, :error_code, :string
    add_column :tails, :captcha_sid, :string
    add_column :tails, :captcha_img, :string
  end
end
