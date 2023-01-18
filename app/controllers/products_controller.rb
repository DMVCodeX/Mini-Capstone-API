class ProductsController < ApplicationController
  def all_products
    product_info = @product
    render template: "contacts/show"
  end
end
