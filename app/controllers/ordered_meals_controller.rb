class OrderedMealsController < ApplicationController
  def create
    @ordered_meal = OrderedMeal.new
    @order = current_user.orders.last
    @ordered_meal.order = @order
    @meal = Meal.find(params[:meal_id])
    @ordered_meal.meal = @meal
    @ordered_meal.quantity = 1
    @ordered_meal.save

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @ordered_meal = OrderedMeal.find(params[:id])
    @ordered_meal.destroy
    redirect_to order_path(@ordered_meal.order)
  end
end
