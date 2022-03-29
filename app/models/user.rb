class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :reviews

  geocoded_by :address_street_number, :address_street, :city, :zipcode, :country
  after_validation :geocode, if: :will_save_change_to_address?
end
