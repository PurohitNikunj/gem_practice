class User < ApplicationRecord
  has_secure_password
  attr_accessor :skip_password
  validates_presence_of :name
  validates :password, presence: true, if: :skip_password
  validates :password, confirmation: true, if: :skip_password
  validates :password_confirmation, presence: true, if: :skip_password
  has_many :books, dependent: :destroy
end
