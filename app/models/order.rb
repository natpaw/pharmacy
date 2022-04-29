class Order < ApplicationRecord
	validates :total, :status, presence: true
	validates :total, numericality: true
	validates :status, numericality: { only_integer: true, in: 0..2 }
	
	enum status: {
		pending: 0,
		declined: 1,
		completed: 2
	}
	belongs_to :user
	belongs_to :pharmacist
	has_many :ordered_medicines
	has_many :medicines, through: :ordered_medicines
end
