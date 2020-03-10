require 'rails_helper'

RSpec.describe "post_groups/edit", type: :view do
  before(:each) do
    @post_group = assign(:post_group, PostGroup.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit post_group form" do
    render

    assert_select "form[action=?][method=?]", post_group_path(@post_group), "post" do

      assert_select "input[name=?]", "post_group[name]"
    end
  end
end
