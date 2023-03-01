class CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    #@carted_products = CartedProduct.where(user_id: current_user.id, status: "carted") -  This has the same result/function as the code below
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render :show
  end

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: params[:order_id],
      status: "carted",
    )

    if @carted_product.save
      render :show
    else
      render json: { errors: @carted_product.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
