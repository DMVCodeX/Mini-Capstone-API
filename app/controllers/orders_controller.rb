class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render :index
  end

  def show
    @order = current_user.orders.find_by(id: params[:id])
    render :show
    # @order = current_user.orders

  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    # if @carted_products.length == 0
    #   render json: { errors: @carted_products.errors.full_messages }, status: :unprocessable_entity
    #   return
    # end

    calculated_subtotal = 0
    index = 0
    while index < carted_products.length
      carted_product = carted_products[index]
      calculated_subtotal += carted_product.quantity * carted_product.product.price
      index += 1
    end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )

    if @order.save
      index = 0
      while index < carted_products.length
        carted_product = carted_products[index]
        carted_product.update(status: "purchased", order_id: @order.id)
        index += 1
      end

      render :show
    else
      render json: { error: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
