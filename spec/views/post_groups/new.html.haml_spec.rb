require 'rails_helper'

RSpec.describe "post_groups/new", type: :view do
  before(:each) do
    assign(:post_group, PostGroup.new(
      :name => "MyString"
    ))
  end

  it "renders new post_group form" do
    render

    assert_select "form[action=?][method=?]", post_groups_path, "post" do

      assert_select "input[name=?]", "post_group[name]"
    end
  end
end
