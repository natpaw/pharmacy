class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
	add_column :users, :role, :integer, default: 0
	add_reference :pharmacists, :user, foreign_key: true
	add_reference :doctors, :user, foreign_key: true
	remove_column :pharmacists, :first_name, :string
	remove_column :pharmacists, :last_name, :string
	remove_column :doctors, :first_name, :string
	remove_column :doctors, :last_name, :string	
  end
end
