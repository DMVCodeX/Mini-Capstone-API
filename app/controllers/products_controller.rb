class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all.order(:id)
    render :index
  end

  def create
    @product = Product.create(
      supplier_id: params[:supplier_id],
      name: params["name"],
      price: params["price"],
      description: params["description"],
    )

    if @product.valid?
      # Image.create(product_id: @product.id, url: params[:image_url]) its is best to make it restful and make an images controller to add images.
      render :show
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render :show
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
    )
    render :show
  end

  def destory
    @product = Product.find_by(id: params["id"])
    @product.destroy
    render json: { message: "Recipe Destoryed Successfully" }
  end
end
