class Medicine < ApplicationRecord
	validates :name, :price, :quantity, presence: true
	validates :name, uniqueness: true
	validates :price, numericality: true
	validates :quantity, numericality: { only_integer: true, greater_than: 0 }
	
	has_many :prescriptions
	has_many :ordered_medicines
end
