require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    assign(:question, Question.create!(
      quest_text: "Quest Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Quest Text/)
  end
end
