class AddUserToMeals < ActiveRecord::Migration[6.1]
  def change
    add_reference :meals, :user, null: false, foreign_key: true
  end
end
