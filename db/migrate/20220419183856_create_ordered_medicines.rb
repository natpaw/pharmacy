class CreateOrderedMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_medicines do |t|
      t.integer :quantity
      t.string :presc_number
      t.timestamps
    end
	add_reference :ordered_medicines, :order, foreign_key: true 
	add_reference :ordered_medicines, :medicine, foreign_key: true 
	add_reference :ordered_medicines, :prescription, foreign_key: true 
  end
end
