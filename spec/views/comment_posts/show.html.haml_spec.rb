require 'rails_helper'

RSpec.describe "comment_posts/show", type: :view do
  before(:each) do
    @comment_post = assign(:comment_post, CommentPost.create!(
      :user => nil,
      :owner_id => "",
      :post_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
