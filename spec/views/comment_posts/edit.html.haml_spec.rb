require 'rails_helper'

RSpec.describe "comment_posts/edit", type: :view do
  before(:each) do
    @comment_post = assign(:comment_post, CommentPost.create!(
      :user => nil,
      :owner_id => "",
      :post_id => 1
    ))
  end

  it "renders the edit comment_post form" do
    render

    assert_select "form[action=?][method=?]", comment_post_path(@comment_post), "post" do

      assert_select "input[name=?]", "comment_post[user_id]"

      assert_select "input[name=?]", "comment_post[owner_id]"

      assert_select "input[name=?]", "comment_post[post_id]"
    end
  end
end
