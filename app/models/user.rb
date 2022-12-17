class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true  
  enum role: [:user, :admin]
end
