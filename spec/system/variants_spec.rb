require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  before :each do
    User.create(name: 'testadmin', password: '1234')
    Question.create(quest_text: 'Тестовый вопрос')
  end
  context 'Question admin' do
    before do
      visit root_path
      fill_in :name, with: 'testadmin'
      fill_in :password, with: '1234'
      click_button 'Login'
      visit new_variant_path
    end
    scenario 'Go to variant admin' do
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant without question' do
      fill_in :vartext, with: 'test variant'
      click_button 'Create Variant'
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant with wrong' do
      fill_in :vartext, with: 'test variant'
      fill_in :questid, with: '100'
      click_button 'Create Variant'
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Create variant admin' do
      fill_in :vartext, with: 'Тестовый вариант'
      fill_in :questid, with: Question.last.id
      click_button 'Create Variant'
      expect(page).to have_content('Variant was successfully created')
    end
    scenario 'Delete variant admin' do
      fill_in :vartext, with: 'Тестовый вариант'
      fill_in :questid, with: Question.last.id
      click_button 'Create Variant'
      click_button 'Destroy this variant'
      expect(page).to have_content('Variant was successfully destroyed.')
    end
  end
  scenario 'Create variant not admin' do
    User.create(name: 'testuser', password: '1234')
    visit root_path
    fill_in :name, with: 'testuser'
    fill_in :password, with: '1234'
    click_button 'Login'
    expect(current_path).to eq root_path
  end
  scenario 'Register, login, calculate' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina'
    click_button 'Login'
    expect(page).to have_current_path "/en/exam/cabinet"
  end
end