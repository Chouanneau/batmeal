class OrderedMealsController < ApplicationController
  def new
    @ordered_meal = Ordered_meal.new
  end

  def create
    raise
    @ordered_meal = Ordered_meal.new(ordered_meal_params)
    @ordered_meal.order = @order
    raise
    @ordered_meal.save

    redirect_to meals_path
  end

  private

  def meal_params
    params.require(:ordered_meal).permit(:quantity)
  end
end
