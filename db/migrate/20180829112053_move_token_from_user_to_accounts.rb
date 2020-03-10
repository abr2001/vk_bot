class MoveTokenFromUserToAccounts < ActiveRecord::Migration[5.1]
  def up
    User.find_each do |user|
      Account.create(
        user_id: user.id,
        token: user.token_vk,
        name: user.email,
        provider: Account::PROVIDER[:vk]
      )
    end
  end

  def down
    Account.destroy_all
  end
end
