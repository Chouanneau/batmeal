class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :category
      t.integer :quantity
      t.datetime :date_time_start
      t.datetime :date_time_end

      t.timestamps
    end
  end
end
