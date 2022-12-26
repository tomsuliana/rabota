require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'try to add invalid question' do
    it 'Adds correctly' do
        expect { Question.create!(quest_text: '') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect { Question.create!(quest_text: 'test') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect { Question.create!(quest_text: 'testquestion') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect(Question.create!(quest_text: 'Тестовый вопрос')).not_to be_nil
    end
    it 'Adds correctly' do
        Question.create(quest_text: 'Тестовый вопрос')
        expect { Question.create!(quest_text: 'Тестовый вопрос') }.to raise_error ActiveRecord::RecordInvalid
    end
  end
  describe 'try to add invalid variant' do
    it 'Adds correctly' do
        expect { Variant.create!(var_text: '') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect { Variant.create!(var_text: 'test') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect { Variant.create!(var_text: 'testvariant') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        Question.create(quest_text: 'Тестовый вопрос')
        expect(Variant.create!(var_text: 'Тестовый вариант', question_id: Question.last.id )).not_to be_nil
    end
    it 'Adds correctly' do
        Variant.create(var_text: 'Тестовый вариант')
        expect { Variant.create!(var_text: 'Тестовый вариант') }.to raise_error ActiveRecord::RecordInvalid
    end
  end
  describe 'try to add invalid user' do
    it 'Adds correctly' do
        expect { User.create!(name: 'testuser', password: '') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect { User.create!(name: 'testuser', password: '111') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect { User.create!(name: 'testuser', password: '111111111') }.to raise_error ActiveRecord::RecordInvalid
    end
    it 'Adds correctly' do
        expect(User.create!(name: 'testuser', password: 'alina123')).not_to be_nil
    end
    it 'Adds correctly' do
        User.create(name: 'testuser', password: 'alina123')
        expect { User.create!(name: 'testuser', password: 'alina123') }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end