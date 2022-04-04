class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def add_ordered_meal_to_cart
    @ordered_meal = Meal.find(params[:id])

  end
end
