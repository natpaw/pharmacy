class OrderedMedicine < ApplicationRecord
	validates :quantity, presence: true
	validates :quantity, numericality: { only_integer: true, greater_than: 0 }
	
	belongs_to :order
	belongs_to :medicine
	has_one :prescription
end
