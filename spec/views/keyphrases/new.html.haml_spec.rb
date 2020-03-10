require 'rails_helper'

RSpec.describe "keyphrases/new", type: :view do
  before(:each) do
    assign(:keyphrase, Keyphrase.new(
      :value => "MyString"
    ))
  end

  it "renders new keyphrase form" do
    render

    assert_select "form[action=?][method=?]", keyphrases_path, "post" do

      assert_select "input[name=?]", "keyphrase[value]"
    end
  end
end
