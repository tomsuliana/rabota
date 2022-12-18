class User < ApplicationRecord
  has_secure_password
  has_many :examines
  validates :name, uniqueness: true  
  enum role: [:user, :admin]
end
