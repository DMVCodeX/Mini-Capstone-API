class User < ApplicationRecord
  has_many :orders
  has_many :carted_products

  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :name, presence: true
  validates :username, presence: true
end
