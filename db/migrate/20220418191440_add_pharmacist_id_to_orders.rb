class AddPharmacistIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :pharmacist, foreign_key: true 
  end
end
