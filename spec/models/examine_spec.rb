require 'rails_helper'

RSpec.describe Examine, type: :model do
  describe 'Add and search db(check adding to db)' do
    i = rand(1..100)
    it 'Adds correctly' do
      expect(Examine.create(score: i, user_id: i)).not_to be_nil
    end
    it 'Adds correctly score' do
      Examine.create(score: i, user_id: i)
      expect(Examine.where(score: i)).not_to be_nil
    end
    it 'Adds correctly user' do
      Examine.create(score: i, user_id: i)
      expect(Examine.where(user: i)).not_to be_nil
    end
    it 'Adds correctly all' do
      Examine.create(score: i, user_id: i)
      expect(Examine.where(score: i, user_id: i)).not_to be_nil
    end
  end

  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      i = rand(1..100)
      t = Examine.create(score: i, user_id: i)
      t1 = Examine.create(score: i + 1, user_id: i + 1)
      expect(t1).not_to eq(t)
    end
  end
end
