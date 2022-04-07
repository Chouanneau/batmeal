class UsersController < ApplicationController
  def edit_cook
  end

  def update_cook
    current_user.role = "cook"
    if current_user.update(cook_params)
      redirect_to my_meals_path
    else
      render :new
    end
  end

  private

  def cook_params
    params.require(:user).permit(:bio, :opening_hour, :closing_hour, :banner, :avatar)
  end
end
