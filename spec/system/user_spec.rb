require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  before :each do
    Question.create(id: 1, quest_text: 'Тестовый вопрос1')
    Question.create(id: 2, quest_text: 'Тестовый вопрос2')
    Question.create(id: 3, quest_text: 'Тестовый вопрос3')
    Question.create(id: 4, quest_text: 'Тестовый вопрос4')
    Question.create(id: 5, quest_text: 'Тестовый вопрос5')
    Question.create(id: 6, quest_text: 'Тестовый вопрос6')
    Question.create(id: 7, quest_text: 'Тестовый вопрос7')
    Question.create(id: 8, quest_text: 'Тестовый вопрос8')
    Question.create(id: 9, quest_text: 'Тестовый вопрос9')
    Question.create(id: 10, quest_text: 'Тестовый вопрос10')
    Variant.create(id: 101, var_text: 'Тестовый вариант1', correct: true, question_id: 1)
    Variant.create(id: 102,var_text: 'Тестовый вариант2', correct: false, question_id: 1)
    Variant.create(id: 103,var_text: 'Тестовый вариант3', correct: true, question_id: 2)
    Variant.create(id: 104,var_text: 'Тестовый вариант4', correct: false, question_id: 2)
    Variant.create(id: 105,var_text: 'Тестовый вариант5', correct: true, question_id: 3)
    Variant.create(id: 106,var_text: 'Тестовый вариант6', correct: false, question_id: 3)
    Variant.create(id: 107,var_text: 'Тестовый вариант7', correct: true, question_id: 4)
    Variant.create(id: 108,var_text: 'Тестовый вариант8', correct: false, question_id: 4)
    Variant.create(id: 109,var_text: 'Тестовый вариант9', correct: true, question_id: 5)
    Variant.create(id: 110,var_text: 'Тестовый вариант10', correct: false, question_id: 5)
    Variant.create(id: 111,var_text: 'Тестовый вариант11', correct: true, question_id: 6)
    Variant.create(id: 112,var_text: 'Тестовый вариант12', correct: false, question_id: 6)
    Variant.create(id: 113,var_text: 'Тестовый вариант13', correct: true, question_id: 7)
    Variant.create(id: 114,var_text: 'Тестовый вариант14', correct: false, question_id: 7)
    Variant.create(id: 115,var_text: 'Тестовый вариант15', correct: true, question_id: 8)
    Variant.create(id: 116,var_text: 'Тестовый вариант16', correct: false, question_id: 8)
    Variant.create(id: 117,var_text: 'Тестовый вариант17', correct: true, question_id: 9)
    Variant.create(id: 118,var_text: 'Тестовый вариант18', correct: false, question_id: 9)
    Variant.create(id: 119,var_text: 'Тестовый вариант19', correct: true, question_id: 10)
    Variant.create(id: 120,var_text: 'Тестовый вариант20', correct: false, question_id: 10)
  end
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
  scenario 'Register, login, answer' do
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
    find('#id101').click
    find('#ans1').click
    find('#id103').click
    find('#ans2').click
    click_button 'Завершить экзамен'
    expect(page).to have_content('Score: 2')
  end
  scenario 'Register, login, answer' do
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
    find('#id101').click
    find('#ans1').click
    sleep(6)
    expect(page).to have_content('Ваше время вышло')
  end
end