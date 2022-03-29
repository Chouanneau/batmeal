class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :cook
      t.references :customer

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :cook_id
    add_foreign_key :reviews, :users, column: :customer_id
  end
end
