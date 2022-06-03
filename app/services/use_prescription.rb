class UsePrescription < ApplicationService
  attr_reader :order_id  
	
  def initialize(order_id)
    @order_id = order_id
  end

  def call
	ordered_medicines = OrderedMedicine.where(order_id: @order_id)
	ordered_medicines.each do |ordered_medicine|
		if ordered_medicine.presc_number.present?
			presc = Prescription.find_by number: ordered_medicine.presc_number
			presc.status = 'used'
			presc.save
		end
	end
	return true
  end
end
