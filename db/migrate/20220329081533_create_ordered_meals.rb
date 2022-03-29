class CreateOrderedMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_meals do |t|
      t.integer :quantity
      t.references :meal, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
