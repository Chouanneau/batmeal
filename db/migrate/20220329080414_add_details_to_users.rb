class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address_street, :string
    add_column :users, :address_street_number, :integer
    add_column :users, :city, :string
    add_column :users, :zipcode, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_customer, :boolean
    add_column :users, :is_cook, :boolean
    add_column :users, :username, :string
  end
end
