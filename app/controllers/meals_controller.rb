class MealsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:search].present?
      sql_query = " \
      meals.title ILIKE :query \
      OR meals.description ILIKE :query \
      OR users.city ILIKE :query \
      OR users.username ILIKE :query \
      "
      @meals = Meal.joins(:user).where(sql_query, query: "%#{params[:search]}%")
    elsif params[:address].present?
      @user_latitude = request.location.latitude
      @user_longitude = request.location.longitude
      location = [@user_latitude, @user_longitude]
      users = User.near(location, 3)

        @meals_array = users.map do |user|
          user.meals
        end
      @meals = @meals_array.flatten
    else
      @meals = Meal.all
    end

    # users = User.near(params[:address], 3)
    #     @meals_array = users.map do |user|
    #       user.meals
    #     end
    #   @meals = @meals_array.flatten
    # else
    #   @meals = Meal.all
    # end

    # @users = User.all

    @markers = @meals.map do |meal|
      {
        lat: meal.user.latitude,
        lng: meal.user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: meal.user }),
        image_url: helpers.asset_url("")
      }
    end


  end

  def show
    @meal = Meal.find(params[:id])
    @user = @meal.user
    # byebug
    # @user = Meal.find(params[:id])
    @markers = @user.geocode.map do |meal|
      {
        lat: @user.latitude,
        lng: @user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: @user }),
        image_url: helpers.asset_url("")
      }
    end
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

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)

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
