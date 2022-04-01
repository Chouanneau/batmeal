class UsersController < ApplicationController
  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    @user = User.find(params[:id])
    @user.update(meal_params)

    if @user.save
      redirect_to my_meals_path
    else
      render :new
    end
  end
end
