class User < ApplicationRecord
  has_secure_password
  validates :email, :uniquesness, presence: true
  validates :username, :uniqueness, presence: true
end
