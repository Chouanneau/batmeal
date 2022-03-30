class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("")
      }
    end
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
