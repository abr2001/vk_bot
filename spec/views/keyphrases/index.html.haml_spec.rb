require 'rails_helper'

RSpec.describe "keyphrases/index", type: :view do
  before(:each) do
    assign(:keyphrases, [
      Keyphrase.create!(
        :value => "Value"
      ),
      Keyphrase.create!(
        :value => "Value"
      )
    ])
  end

  it "renders a list of keyphrases" do
    render
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
