require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'Add and search db(check adding to db)' do
    i = rand(1..100)
    it 'Adds correctly' do
      expect(Answer.create(examine_id: i, quest_id: i, user_answer: i)).not_to be_nil
    end
    it 'Adds correctly examine' do
      Answer.create(examine_id: i, quest_id: i, user_answer: i)
      expect(Answer.where(examine_id: i)).not_to be_nil
    end
    it 'Adds correctly question' do
      Answer.create(examine_id: i, quest_id: i, user_answer: i)
      expect(Answer.where(quest_id: i)).not_to be_nil
    end
    it 'Adds correctly user_answer' do
      Answer.create(examine_id: i, quest_id: i, user_answer: i)
      expect(Answer.where(user_answer: i)).not_to be_nil
    end
    it 'Adds correctly all' do
      Answer.create(examine_id: i, quest_id: i, user_answer: i)
      expect(Answer.where(examine_id: i, quest_id: i, user_answer: i)).not_to be_nil
    end
  end

  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      i = rand(1..100)
      t = Answer.create(examine_id: i, quest_id: i, user_answer: i)
      t1 = Answer.create(examine_id: i + 1, quest_id: i + 1 , user_answer: i + 1)
      expect(t1).not_to eq(t)
    end
  end
end
