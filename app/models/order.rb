class Order < ApplicationRecord
  validate :validate_carted_products

  belongs_to :user
  has_many :products, through: :carted_products
  has_many :carted_products

  def validate_carted_products
    carted_products_count = User.find_by(id: user_id).carted_products.where(status: "carted").size
    errors.add(:carted_products, "can't be empty") if carted_products_count == 0
  end
end
