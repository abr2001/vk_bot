require 'rails_helper'

RSpec.describe "post_groups/index", type: :view do
  before(:each) do
    assign(:post_groups, [
      PostGroup.create!(
        :name => "Name"
      ),
      PostGroup.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of post_groups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
