class DoctorPolicy < ApplicationPolicy
  def index?
		user.try(:admin?) 
	end
	
	def show?
		user.try(:admin?) or user.id == record.id
	end
	
	def update?
		user.id == record.id
	end
	
	def destroy?
		user.id == record.id
	end
end
