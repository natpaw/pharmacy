class Order < ApplicationRecord
	validates :status, presence: true
	
	enum status: {
		fresh: 0,
		pending: 1,
		declined: 2,
		completed: 3
	}
	belongs_to :user
	belongs_to :pharmacist, optional: true
	has_many :ordered_medicines, dependent: :destroy

end
