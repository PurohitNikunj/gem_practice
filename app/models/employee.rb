class Employee < ApplicationRecord
  has_secure_password
  validates :name, :email, :gender, presence: true
  validates :password, presence: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  enum :gender, { male:"0", female:"1", other:"2" }
end
