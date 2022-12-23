class User < ApplicationRecord
  has_secure_password
  has_many :examines
  validates :name, uniqueness: true  
  validates :password, presence: true, :length => { :minimum => 5, message: 'Please input 6 minimum'}
  enum role: [:user, :admin]
end
