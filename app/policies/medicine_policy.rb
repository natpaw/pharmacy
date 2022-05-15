class MedicinePolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :medicine

	def initialize(user, medicine)
		@user = user
		@medicine = medicine
	end
  end
	def index?
		user.try(:admin?) or user.class.table_name == "pharmacists"
	end
	
	def new?
		user.try(:admin?) or user.class.table_name == "pharmacists"
	end
	
	def show?
		user.try(:admin?) or user.class.table_name == "pharmacists"
	end
	
	def create?
		user.try(:admin?) or user.class.table_name == "pharmacists"
	end
	
	def update?
		user.try(:admin?) or user.class.table_name == "pharmacists"
	end
	
	def destroy?
		user.try(:admin?) or user.class.table_name == "pharmacists"
	end
end

