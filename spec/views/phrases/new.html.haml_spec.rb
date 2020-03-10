require 'rails_helper'

RSpec.describe "phrases/new", type: :view do
  before(:each) do
    assign(:phrase, Phrase.new(
      :value => "MyText",
      :keyphrase => nil
    ))
  end

  it "renders new phrase form" do
    render

    assert_select "form[action=?][method=?]", phrases_path, "post" do

      assert_select "textarea[name=?]", "phrase[value]"

      assert_select "input[name=?]", "phrase[keyphrase_id]"
    end
  end
end
