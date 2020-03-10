require 'rails_helper'

RSpec.describe "comment_posts/index", type: :view do
  before(:each) do
    assign(:comment_posts, [
      CommentPost.create!(
        :user => nil,
        :owner_id => "",
        :post_id => 2
      ),
      CommentPost.create!(
        :user => nil,
        :owner_id => "",
        :post_id => 2
      )
    ])
  end

  it "renders a list of comment_posts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
