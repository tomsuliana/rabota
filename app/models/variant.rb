class Variant < ApplicationRecord
  belongs_to :question 
  validates :var_text, presence: true, :length => { :minimum => 10, message: 'Please input 10 minimum'}
  validates :var_text, format: { with: /(?=.*[а-я])[0-9а-яА-Я!?$%^&* ,]{10,}/, message: 'Text must have minimum 1 russian letter' }
end
