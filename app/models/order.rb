class Order < ApplicationRecord
	validates :total, :status, presence: true
	validates :total, numericality: true

	
	enum status: {
		pending: 0,
		declined: 1,
		completed: 2
	}
	belongs_to :user
	belongs_to :pharmacist
	has_many :ordered_medicines

end
