class CreateOrderedMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_medicines do |t|
      t.integer :medicine_id
      t.integer :quantity
      t.string :presc_number
      t.integer :order_id

      t.timestamps
    end
  end
end
