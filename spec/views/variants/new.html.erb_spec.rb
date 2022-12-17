require 'rails_helper'

RSpec.describe "variants/new", type: :view do
  before(:each) do
    assign(:variant, Variant.new(
      var_text: "MyString",
      correct: false,
      question_id: 1
    ))
  end

  it "renders new variant form" do
    render

    assert_select "form[action=?][method=?]", variants_path, "post" do

      assert_select "input[name=?]", "variant[var_text]"

      assert_select "input[name=?]", "variant[correct]"

      assert_select "input[name=?]", "variant[question_id]"
    end
  end
end
