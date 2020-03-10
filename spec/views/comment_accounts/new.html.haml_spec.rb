require 'rails_helper'

RSpec.describe "comment_accounts/new", type: :view do
  before(:each) do
    assign(:comment_account, CommentAccount.new(
      :owner_id => 1
    ))
  end

  it "renders new comment_account form" do
    render

    assert_select "form[action=?][method=?]", comment_accounts_path, "post" do

      assert_select "input[name=?]", "comment_account[owner_id]"
    end
  end
end
