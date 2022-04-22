class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0
      t.string :comment
      t.decimal :total

      t.timestamps
    end
  end
end
