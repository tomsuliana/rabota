require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'Add and search db(check adding to db)' do
    it 'Adds correctly' do
      expect(Question.create(quest_text: 'test')).not_to be_nil
    end
    it 'Adds correctly score' do
      Question.create(quest_text: 'test')
      expect(Question.where(quest_text: 'test')).not_to be_nil
    end
  end
  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      t = Question.create(quest_text: 'test')
      t1 = Question.create(quest_text: 'test1')
      expect(t1).not_to eq(t)
    end
  end
end
