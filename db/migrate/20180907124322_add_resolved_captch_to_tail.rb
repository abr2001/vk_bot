class AddResolvedCaptchToTail < ActiveRecord::Migration[5.1]
  def change
    add_column :tails, :resolved_captcha, :boolean, default: false
  end
end
