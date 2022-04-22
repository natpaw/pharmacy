class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.boolean :prescription
      t.boolean :children

      t.timestamps
    end
  end
end
