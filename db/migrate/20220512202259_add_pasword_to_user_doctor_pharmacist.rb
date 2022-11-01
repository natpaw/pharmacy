class AddPaswordToUserDoctorPharmacist < ActiveRecord::Migration[6.1]
  def change
	add_column :users, :encrypted_password, :string
	add_column :doctors, :encrypted_password, :string
	add_column :pharmacists, :encrypted_password, :string
  end
end
