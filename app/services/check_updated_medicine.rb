class CheckUpdatedMedicine < ApplicationService
  attr_reader :ordered_medicine
  
  class MedicineAlreadyInOrderError < StandardError
	def message
		"Ліки вже є в замовленні"
	end
  end
	
  def initialize(ordered_medicine, new_ordered_medicine)
    @ordered_medicine = ordered_medicine
	@new_ordered_medicine = new_ordered_medicine
	@order_id = ordered_medicine.order_id
  end

  def call
	ordered_medicines = OrderedMedicine.where(order_id: @order_id)
	ordered_medicines.each do |ord_medicine|
		
		if  @new_ordered_medicine.medicine == ord_medicine.medicine and @ordered_medicine.id != ord_medicine.id 
			raise MedicineAlreadyInOrderError
		end
	end
	return true
  end
end