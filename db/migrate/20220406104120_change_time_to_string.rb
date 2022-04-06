class ChangeTimeToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :opening_hour, :string
    change_column :users, :closing_hour, :string
  end
end
