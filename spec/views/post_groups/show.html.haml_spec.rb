require 'rails_helper'

RSpec.describe "post_groups/show", type: :view do
  before(:each) do
    @post_group = assign(:post_group, PostGroup.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
