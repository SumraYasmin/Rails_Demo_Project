class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string 
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :role, :integer, default: 0
    add_column :users, :status, :integer, default: 1
  end
end
