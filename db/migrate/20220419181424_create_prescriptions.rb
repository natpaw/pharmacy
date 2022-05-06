class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :number
      t.date :exp_date
      t.boolean :children
      t.integer :status, default: 0
	  t.integer :quantity

      t.timestamps
    end
	add_reference :prescriptions, :medicine, foreign_key: true 
	add_reference :prescriptions, :doctor, foreign_key: true 

	
  end
end
