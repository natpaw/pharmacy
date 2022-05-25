class MedicineBooking < ApplicationService
attr_reader :order_id

  def initialize(order_id)
    @order_id = order_id
  end

  def call
	ordered_medicines = OrderedMedicine.where(order_id: @order_id)
	new_medicine_quantity = 0
	ordered_medicines.each do |ordered_medicine|
		new_medicine_quantity = ordered_medicine.medicine.quantity - ordered_medicine.quantity
		ordered_medicine.medicine.quantity = new_medicine_quantity
		ordered_medicine.medicine.save
	end
  end
end