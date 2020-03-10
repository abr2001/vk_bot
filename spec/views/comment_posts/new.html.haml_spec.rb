require 'rails_helper'

RSpec.describe "comment_posts/new", type: :view do
  before(:each) do
    assign(:comment_post, CommentPost.new(
      :user => nil,
      :owner_id => "",
      :post_id => 1
    ))
  end

  it "renders new comment_post form" do
    render

    assert_select "form[action=?][method=?]", comment_posts_path, "post" do

      assert_select "input[name=?]", "comment_post[user_id]"

      assert_select "input[name=?]", "comment_post[owner_id]"

      assert_select "input[name=?]", "comment_post[post_id]"
    end
  end
end
