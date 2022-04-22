class AddPharmacistIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :pharmacist_id, :integer
  end
end
