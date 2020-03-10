require 'rails_helper'

RSpec.describe "keyphrases/show", type: :view do
  before(:each) do
    @keyphrase = assign(:keyphrase, Keyphrase.create!(
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Value/)
  end
end
