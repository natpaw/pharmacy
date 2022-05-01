class User < ApplicationRecord

	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
#	validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
#		message: "only allows letters" }
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Only emails allowed' }
	
	enum role: {
		patient: 0,
		pharmacist: 1,
		doctor: 2, 
		admin: 3
	}
		
	has_many :orders
	has_many :prescriptions
	has_one :doctor
	has_one :pharmacist
end
