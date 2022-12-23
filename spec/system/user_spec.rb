require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  scenario 'Create question not admin' do
    visit root_path
    fill_in :name, with: 'testuser'
    fill_in :password, with: '1234'
    click_button 'Login'
    expect(current_path).to eq root_path
  end
  scenario 'Register, login' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina123'
    click_button 'Login'
    expect(page).to have_current_path root_path
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
  scenario 'Exam' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina'
    click_button 'Login'
    click_button 'Try exam'
    expect(page).to have_current_path "/exam/exam_process?commit=Try+exam"
  end
  scenario 'Exam finish' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina'
    click_button 'Login'
    click_button 'Try exam'
    click_button 'Завершить экзамен'
    expect(page).to have_content('Exam results')
  end
  scenario 'Exam finish and back to cabinet' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina'
    click_button 'Login'
    click_button 'Try exam'
    click_button 'Завершить экзамен'
    click_button 'Back to cabinet'
    expect(page).to have_current_path "/en/exam/cabinet?commit=Back+to+cabinet"
  end
  scenario 'Register, login, exit' do
    visit new_user_path
    fill_in :user_name, with: 'Alina'
    fill_in :user_password, with: 'alina'
    fill_in :user_password_confirmation, with: 'alina'
    click_button 'Create User'
    visit root_path
    fill_in :name, with: 'Alina'
    fill_in :password, with: 'alina'
    click_button 'Login'
    click_button 'Exit'
    expect(page).to have_current_path "/en"
  end
end