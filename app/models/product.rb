class Product < ApplicationRecord
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: { in: 3..1000 }

  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :categories, through: :category_products

  def is_discounted?
    price <= 10
    # is_discounted = false
    # if price <= 10
    #   is_discounted = true
    # else
    #   is_discounted = false
    # end
    # return is_discounted
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    total = price + tax
    return total
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
