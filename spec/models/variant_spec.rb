require 'rails_helper'

RSpec.describe Variant, type: :model do
  describe 'Add and search db(check adding to db)' do
    i = rand(1..100)
    it 'Adds correctly' do
      expect(Variant.create(var_text: 'testvar', question_id: i)).not_to be_nil
    end
    it 'Adds correctly var text' do
      Variant.create(var_text: 'testvar', question_id: i)
      expect(Variant.where(var_text: 'testvar')).not_to be_nil
    end
    it 'Adds correctly question' do
      Variant.create(var_text: 'testvar', question_id: i)
      expect(Variant.where(question_id: i)).not_to be_nil
    end
    it 'Adds correctly all' do
      Variant.create(var_text: 'testvar', question_id: i)
      expect(Variant.where(var_text: 'testvar', question_id: i)).not_to be_nil
    end
  end

  describe 'WE have different results when enter different input values' do
    it '1!=2' do
      i = rand(1..100)
      t = Variant.create(var_text: 'testvar', question_id: i)
      t1 = Variant.create(var_text: 'testvar1', question_id: i + 1)
      expect(t1).not_to eq(t)
    end
  end
end
