require 'rails_helper'

RSpec.describe "phrases/index", type: :view do
  before(:each) do
    assign(:phrases, [
      Phrase.create!(
        :value => "MyText",
        :keyphrase => nil
      ),
      Phrase.create!(
        :value => "MyText",
        :keyphrase => nil
      )
    ])
  end

  it "renders a list of phrases" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
