class Meal < ApplicationRecord
  has_many :ordered_meals
  has_one_attached :photo
end
