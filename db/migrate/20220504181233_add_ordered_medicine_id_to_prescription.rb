class AddOrderedMedicineIdToPrescription < ActiveRecord::Migration[6.1]
  def change
	add_reference :prescriptions, :ordered_medicine, foreign_key: true 
  end
end
