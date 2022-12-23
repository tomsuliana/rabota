require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Static content', type: :system do
  before :each do
    User.create(name: 'testadmin', password: '1234')
    User.last.admin!
  end
  context 'Question admin' do
    before do
      visit root_path
      fill_in :name, with: 'testadmin'
      fill_in :password, with: '1234'
      click_button 'Login'
    end
    scenario 'Go to admin' do
      expect(page).to have_current_path "/en/admin/panel"
    end
    scenario 'Go to question admin' do
      visit new_question_path
      expect(page).to have_current_path new_question_path
    end
    scenario 'Go to variant admin' do
      visit new_variant_path
      expect(page).to have_current_path new_variant_path
    end
    scenario 'Go to users admin' do
      visit users_path
      expect(page).to have_current_path users_path
    end
  end
end