class MealsController < ApplicationController
  def index
    @users = User.all
    if params[:search].present?
      sql_query = " \
        meals.title ILIKE :query \
        OR meals.description ILIKE :query \
      "
      @meals = Meal.all.where(sql_query, query: "%#{params[:search][:query]}%")
    else
      @meals = Meal.all
    end
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

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to my_meals_path
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :description, :price, :category, :quantity, :date_time_start, :date_time_end, :photo)
  end
end
