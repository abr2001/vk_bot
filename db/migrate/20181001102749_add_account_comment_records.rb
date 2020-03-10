class AddAccountCommentRecords < ActiveRecord::Migration[5.1]
  def up
    Account.all.each do |account|
      CommentAccount.create(owner_id: account.code)
    end
  end

  def down
    CommentAccount.destroy_all
  end
end
