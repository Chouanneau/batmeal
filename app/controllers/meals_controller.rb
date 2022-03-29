class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user

    if @meal.save
      redirect_to my_meals_path
    else
      render :new
    end
  end

  def my_meals
    @meals = Meal.where(user: current_user)
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :description, :price, :category, :quantity, :date_time_start, :date_time_end, :photo)
  end
end
