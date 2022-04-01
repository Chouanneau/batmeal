class UsersController < ApplicationController
  def new_cook
    @user = User.new
  end

  def create_new_cook
    @user = User.new(user_params)
    @meal.user = current_user

    if @user.save
      redirect_to my_meals_path
    else
      render :new
    end
  end
end
