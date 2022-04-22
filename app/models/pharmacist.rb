class Pharmacist < ApplicationRecord
	validates :first_name, :last_name, presence: true
	validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,	message: "only allows letters" }	
	
	has_many :orders
end
