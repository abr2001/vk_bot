require 'rails_helper'

RSpec.describe "phrases/edit", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!(
      :value => "MyText",
      :keyphrase => nil
    ))
  end

  it "renders the edit phrase form" do
    render

    assert_select "form[action=?][method=?]", phrase_path(@phrase), "post" do

      assert_select "textarea[name=?]", "phrase[value]"

      assert_select "input[name=?]", "phrase[keyphrase_id]"
    end
  end
end
