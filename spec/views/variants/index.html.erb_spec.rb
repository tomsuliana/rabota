require 'rails_helper'

RSpec.describe "variants/index", type: :view do
  before(:each) do
    assign(:variants, [
      Variant.create!(
        var_text: "Var Text",
        correct: false,
        question_id: 2
      ),
      Variant.create!(
        var_text: "Var Text",
        correct: false,
        question_id: 2
      )
    ])
  end

  it "renders a list of variants" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Var Text".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
