class OrderedMealsController < ApplicationController
  def create
    @ordered_meal = Ordered_meal.new(ordered_meal_params)
    @ordered_meal.order = @order
    @ordered_meal.save
  end

  private

  def set_ordered_meal
    @ordered_meal = Ordered_meal.find(params[:id])
  end
end
