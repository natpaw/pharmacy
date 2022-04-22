class Medicine < ApplicationRecord
	validates :name, :price, :quantity, :prescription, :children, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: true
	validates :quantity, numericality: { only_integer: true }
	
	has_many :prescriptions
	has_many :ordered_medicines
end
