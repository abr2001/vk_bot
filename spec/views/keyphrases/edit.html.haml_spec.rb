require 'rails_helper'

RSpec.describe "keyphrases/edit", type: :view do
  before(:each) do
    @keyphrase = assign(:keyphrase, Keyphrase.create!(
      :value => "MyString"
    ))
  end

  it "renders the edit keyphrase form" do
    render

    assert_select "form[action=?][method=?]", keyphrase_path(@keyphrase), "post" do

      assert_select "input[name=?]", "keyphrase[value]"
    end
  end
end
