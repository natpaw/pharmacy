class CreatePharmacists < ActiveRecord::Migration[6.1]
  def change
    create_table :pharmacists do |t|
      t.string :first_name
      t.string :last_name
	  t.string :email

      t.timestamps
    end
  end
end
