require 'rails_helper'

RSpec.describe "comment_accounts/edit", type: :view do
  before(:each) do
    @comment_account = assign(:comment_account, CommentAccount.create!(
      :owner_id => 1
    ))
  end

  it "renders the edit comment_account form" do
    render

    assert_select "form[action=?][method=?]", comment_account_path(@comment_account), "post" do

      assert_select "input[name=?]", "comment_account[owner_id]"
    end
  end
end
