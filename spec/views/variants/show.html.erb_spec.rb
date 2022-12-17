require 'rails_helper'

RSpec.describe "variants/show", type: :view do
  before(:each) do
    assign(:variant, Variant.create!(
      var_text: "Var Text",
      correct: false,
      question_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Var Text/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
  end
end
