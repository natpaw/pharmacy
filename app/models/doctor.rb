class Doctor < ApplicationRecord
	validates :total, numericality: true
	
	belongs_to :user
	has_many :prescriptions	
end
