class CreatePrescription < ApplicationService
  attr_reader :prescription
  
  class NoPresriptionNeededError < StandardError
	def message
		"Рецепт не потрібний"
	end
  end
  
  class PrescriptionChildrenError < StandardError
	def message
		"Дитячий рецепт не підходить для дорослого препарату, і навпаки"
	end
  end
  
  class PrescriptionDateError < StandardError
	def message
		"Кінцева дата рецепта вже пройшла"
	end
  end
  
	
  def initialize(prescription)
    @prescription = prescription
  end

  def call
	raise NoPresriptionNeededError unless prescription.medicine.prescription? 
	raise PrescriptionChildrenError unless prescription.medicine.children? == prescription.children
	raise PrescriptionDateError unless Date.today <= prescription.exp_date
	return true
  end
end