class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :number
      t.date :exp_date
      t.boolean :children
      t.integer :status, default: 0
      t.integer :doctor_id
      t.integer :user_id
      t.integer :medicine_id
	  t.integer :ordered_medicine_id
	  t.integer :quantity
      t.decimal :commission

      t.timestamps
    end
  end
end
