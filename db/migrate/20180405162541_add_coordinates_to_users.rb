class AddCoordinatesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :coordinates, :decimal, array:true, default: []
  end
end
