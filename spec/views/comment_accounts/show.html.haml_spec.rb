require 'rails_helper'

RSpec.describe "comment_accounts/show", type: :view do
  before(:each) do
    @comment_account = assign(:comment_account, CommentAccount.create!(
      :owner_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
