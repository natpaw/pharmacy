class CheckPrescription < ApplicationService
  attr_reader :ordered_medicine
  
  class NoPresriptionNeededError < StandardError
	def message
		"Рецепт не потрібний"
	end
  end
  
  class PrescriptionNotFoundError < StandardError
	def message
		"Рецепт не знайдений"
	end
  end
  
  class WrongMedicineError < StandardError
	def message
		"Рецепт на інший препарат"
	end
  end
  
  class PrescriptionNotActiveError < StandardError
	def message
		"Рецепт неактивний"
	end
  end
	
  def initialize(ordered_medicine)
    @ordered_medicine = ordered_medicine
  end

  def call
	if !ordered_medicine.medicine.prescription? 
		raise NoPresriptionNeededError unless ordered_medicine.presc_number.blank?
	end
	if ordered_medicine.medicine.prescription?
		presc = Prescription.find_by number: @ordered_medicine.presc_number
		raise PrescriptionNotFoundError unless presc.present?
		raise WrongMedicineError unless ordered_medicine.medicine == presc.medicine
		if Date.today > presc.exp_date
			presc.status = 'expired'
			presc.save
		end
		raise PrescriptionNotActiveError unless presc.active?
	end
	return true
  end
end