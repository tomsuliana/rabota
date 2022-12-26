class User < ApplicationRecord
  has_secure_password
  has_many :examines
  validates :name, uniqueness: true  
  validates :password, presence: true, :length => { :minimum => 5, message: 'Please input 5 minimum'}
  validates :password, format: { with: /(?=.*[a-z])[0-9a-zA-Z!@#$%^&*]{5,}/, message: 'Password must have minimum 1 letter' }
  enum role: [:user, :admin]
end
