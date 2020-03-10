class SaveStatiscticsForUserAccount < ActiveRecord::Migration[5.1]
  def up
    User.find_each do |user|
      Tail.where(user_id: user.id)
        .update_all(account_id: user.accounts.first.id)
    end
  end

  def down
    Tail.update_all(account_id: nil)
  end
end
