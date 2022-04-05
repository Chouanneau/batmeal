class ChangePriceToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :meals, :price, :integer
  end
end
