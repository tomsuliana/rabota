require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  before :each do
    User.create(name: 'testadmin', password: 'alina123')
  end
  context 'Question admin' do
    before do
      visit root_path
      fill_in :name, with: 'testadmin'
      fill_in :password, with: 'alina123'
      click_button 'Login'
      visit new_question_path
    end
    scenario 'Go to question admin' do
      expect(page).to have_current_path new_question_path
    end
    scenario 'Create question admin' do
      fill_in :quest, with: ''
      click_button 'Create Question'
      expect(page).to have_content('3 errors prohibited this question from being saved:')
    end
    scenario 'Create question admin' do
      fill_in :quest, with: '111'
      click_button 'Create Question'
      expect(page).to have_content('2 errors prohibited this question from being saved:')
    end
    scenario 'Create question admin' do
      fill_in :quest, with: '11111111111'
      click_button 'Create Question'
      expect(page).to have_content('1 error prohibited this question from being saved:')
    end
    scenario 'Create question admin' do
      fill_in :quest, with: 'Тестовый вопрос'
      click_button 'Create Question'
      expect(page).to have_content('Question was successfully created')
    end
  end
  context 'Variant admin' do
    before do
      Question.create(quest_text: 'Тестовый вопрос')
      visit root_path
      fill_in :name, with: 'testadmin'
      fill_in :password, with: 'alina123'
      click_button 'Login'
      visit new_variant_path
    end
    scenario 'Go to variant admin' do
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant admin' do
      fill_in :vartext, with: ''
      fill_in :questid, with: Question.last.id
      click_button 'Create Variant'
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant admin' do
      fill_in :vartext, with: '111'
      fill_in :questid, with: Question.last.id
      click_button 'Create Variant'
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant admin' do
      fill_in :vartext, with: '111111111111'
      fill_in :questid, with: Question.last.id
      click_button 'Create Variant'
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant admin' do
      fill_in :vartext, with: 'Тестовый вариант'
      fill_in :questid, with: Question.last.id
      click_button 'Create Variant'
      expect(page).to have_content('Variant was successfully created')
    end
  end
  context 'User' do
    scenario 'Register, login' do
      visit new_user_path
      fill_in :user_name, with: 'Alina'
      fill_in :user_password, with: ''
      fill_in :user_password_confirmation, with: ''
      click_button 'Create User'
      expect(page).to have_current_path new_user_path
    end
    scenario 'Register, login' do
      visit new_user_path
      fill_in :user_name, with: 'Alina'
      fill_in :user_password, with: '111'
      fill_in :user_password_confirmation, with: '111'
      click_button 'Create User'
      expect(page).to have_current_path new_user_path
    end
    scenario 'Register, login' do
      visit new_user_path
      fill_in :user_name, with: 'Alina'
      fill_in :user_password, with: '1111111'
      fill_in :user_password_confirmation, with: '1111111'
      click_button 'Create User'
      expect(page).to have_current_path new_user_path
    end
    scenario 'Register, login' do
      visit new_user_path
      fill_in :user_name, with: 'Alina'
      fill_in :user_password, with: 'alina123'
      fill_in :user_password_confirmation, with: 'alina12'
      click_button 'Create User'
      expect(page).to have_current_path new_user_path
    end
    scenario 'Register, login' do
      visit new_user_path
      fill_in :user_name, with: 'Alina'
      fill_in :user_password, with: 'alina123'
      fill_in :user_password_confirmation, with: 'alina123'
      click_button 'Create User'
      expect(page).to have_content('User was successfully created')
    end
  end
end