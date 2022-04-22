class OrderedMedicine < ApplicationRecord
	validates :quantity, :order_id, :medicine_id, presence: true
	validates :quantity, :order_id, :medicine_id, numericality: { only_integer: true }
	validates :presc_number, format: { with: /РЛ[0-9]{6}$/ }
	
	belongs_to :order
	belongs_to :medicine
	has_one :prescription
end
