class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @ordered_meals = @order.ordered_meals
  end

  def confirmation
    @order = Order.find(params[:id])
  end
end
