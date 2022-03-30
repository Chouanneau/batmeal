class Meal < ApplicationRecord
  belongs_to :user
  has_many :ordered_meals
  has_one_attached :photo
end
