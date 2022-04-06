class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_meals


    def total_price
      ordered_meals.reduce(0) do |sum, o_meal|
        sum + (o_meal.quantity * o_meal.meal.price)
      end
    end
end
