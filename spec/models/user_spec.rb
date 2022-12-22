require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Add and search db(check adding to db)' do
    subject {
      User.new(name: 'testuser', password: '1234')
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is valid without a name" do
      subject.name = nil
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "default user always nil" do
      expect(subject.role).to eq nil
    end

    it "default user can't be admin" do
      expect(subject.admin?).to eq false
    end
  end
  describe 'uniq field' do
    it 'another checks uniqueness_of field' do
      User.create!(name: 'testuser', password: '1234')
      expect { User.create!(name: 'testuser', password: '1234') }.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
