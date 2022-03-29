class Review < ApplicationRecord
  belongs_to :cook, class_name: 'User', foreign_key: 'cook_id'
  belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
end
