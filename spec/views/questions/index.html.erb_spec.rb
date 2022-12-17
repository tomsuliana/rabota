require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        quest_text: "Quest Text"
      ),
      Question.create!(
        quest_text: "Quest Text"
      )
    ])
  end

  it "renders a list of questions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Quest Text".to_s), count: 2
  end
end
