class Order < ApplicationRecord
	validates :total, :status, :user_id, presence: true
	validates :total, numericality: true
	validates :status, numericality: { only_integer: true, in: 0..2 }
	validates :user_id, pharmacist_id, numericality: { only_integer: true }
	
	enum status: {
		pending: 0,
		declined: 1,
		complited: 2
	}
	belongs_to :user
	belongs_to :pharmacist
	has_many :ordered_medicines
	has_many :medicines, through: :ordered_medicines
end
