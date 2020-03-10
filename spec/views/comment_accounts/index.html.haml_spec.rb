require 'rails_helper'

RSpec.describe "comment_accounts/index", type: :view do
  before(:each) do
    assign(:comment_accounts, [
      CommentAccount.create!(
        :owner_id => 2
      ),
      CommentAccount.create!(
        :owner_id => 2
      )
    ])
  end

  it "renders a list of comment_accounts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
