class OrderedMedicine < ApplicationRecord
	validates :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }
	validates :presc_number, format: { with: /\РЛ[0-9]{6}\z/ }
	
	belongs_to :order
	belongs_to :medicine
	belongs_to :prescription
end
