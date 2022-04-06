class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @ordered_meals = @order.ordered_meals
  end

  def confirmation
    @order = Order.find(params[:order_id])
    @ordered_meals = @order.ordered_meals
    @total_price = @order.total_price
  end
end
