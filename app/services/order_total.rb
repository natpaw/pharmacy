class OrderTotal < ApplicationService
attr_reader :order_id

  def initialize(order_id)
    @order_id = order_id
  end

  def call
	ordered_medicines = OrderedMedicine.where(order_id: @order_id)
	total = 0
	ordered_medicines.each do |ordered_medicine|
		total += ordered_medicine.medicine.price * ordered_medicine.quantity 
	end
	return total
  end
end