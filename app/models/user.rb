class User < ApplicationRecord
	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
	validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
		message: "only allows letters" }
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Only emails allowed' }
		
	has_many :orders
	has_many :prescriptions
end
