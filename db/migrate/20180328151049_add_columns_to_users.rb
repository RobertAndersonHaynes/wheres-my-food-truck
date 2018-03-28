class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :string
    add_column :users, :role, :string, null: false, default: "user"
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :phone_number, :string, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :food_truck_name, :string, null: false
    add_column :users, :url, :string, null: false
    add_column :users, :location, :string
    add_column :users, :profile_pic, :string
    add_column :users, :description, :text, null: false
  end
end
