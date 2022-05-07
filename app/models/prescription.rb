
class Prescription < ApplicationRecord
	validates :number, :exp_date, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }
	validates :number, format: { with: /\РЛ[0-9]{6}\z/ }
#	validates :exp_date, comparison: { greater_than_or_equal_to: Date.today }
#	validates_date :exp_date
	
	enum status: {
		active: 0,
		expired: 1,
		used: 2
	}
	
	belongs_to :doctor
	belongs_to :medicine
	belongs_to :ordered_medicine, optional: true
end
