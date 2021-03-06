class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { customer: 0, cook: 1 }

  has_many :orders
  has_many :reviews
  has_many :meals
  has_one_attached :avatar
  has_one_attached :banner

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?
  after_create :create_order
  before_create :set_customer_role

  def full_address
    "#{self.address_street_number} #{self.address_street}, #{self.city}, #{self.zipcode}, #{self.country}"
  end

  def create_order
    Order.create({user: self})
  end

  def set_customer_role
      self.role = "customer" if self.role == nil
  end

  def address_changed?
    address_street_number_changed? || address_street_number_changed? || city_changed? || zipcode_changed? || country_changed?
  end
end
