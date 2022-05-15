class Order < ApplicationRecord
	validates :status, presence: true
	
	enum status: {
		pending: 0,
		declined: 1,
		completed: 2
	}
	belongs_to :user
	belongs_to :pharmacist
	has_many :ordered_medicines, dependent: :destroy

end
