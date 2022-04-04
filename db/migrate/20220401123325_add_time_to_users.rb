class AddTimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :opening_hour, :time
    add_column :users, :closing_hour, :time
  end
end
