require 'rails_helper'

RSpec.describe "variants/edit", type: :view do
  let(:variant) {
    Variant.create!(
      var_text: "MyString",
      correct: false,
      question_id: 1
    )
  }

  before(:each) do
    assign(:variant, variant)
  end

  it "renders the edit variant form" do
    render

    assert_select "form[action=?][method=?]", variant_path(variant), "post" do

      assert_select "input[name=?]", "variant[var_text]"

      assert_select "input[name=?]", "variant[correct]"

      assert_select "input[name=?]", "variant[question_id]"
    end
  end
end
