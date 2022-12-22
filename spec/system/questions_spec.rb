require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  before :each do
    User.create(name: 'testuser', password: '1234')
    User.create(name: 'testadmin', password: '1234')
    User.last.admin!
  end
  context 'Question admin' do
    before do
      visit root_path
      fill_in :name, with: 'testadmin'
      fill_in :password, with: '1234'
      click_button 'Login'
      visit new_question_path
    end
    scenario 'Go to question admin' do
      expect(page).to have_current_path new_question_path
    end
    scenario 'Create question admin' do
      fill_in :quest, with: 'test question'
      click_button 'Create Question'
      expect(page).to have_content('Question was successfully created')
    end
    scenario 'Delete question admin' do
      fill_in :quest, with: 'test question'
      click_button 'Create Question'
      click_button 'Destroy this question'
      expect(page).to have_content('Question was successfully destroyed.')
    end
  end
  scenario 'Create question not admin' do
    visit root_path
    fill_in :name, with: 'testuser'
    fill_in :password, with: '1234'
    click_button 'Login'
    expect(current_path).to eq root_path
  end
end
