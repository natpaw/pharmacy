class PrescriptionPolicy < ApplicationPolicy
  class Scope < Scope
  attr_reader :user, :prescription
	
    def resolve
      if user.try(:admin?)
        scope.all
	  elsif user.is_a?(Doctor)
        scope.where(doctor_id: @user.id)
	  else
		raise Pundit::NotAuthorizedError
      end
	end
  end
	def index?
		user.try(:admin?) or user.is_a?(Doctor)
	end
	
	def new?
		user.try(:admin?) or user.is_a?(Doctor)
	end
	
	def show?
		user.try(:admin?) or user.is_a?(Doctor)
	end
	
	def create?
		user.try(:admin?) or user.is_a?(Doctor)
	end
	
	def update?
		user.try(:admin?) or user.is_a?(Doctor)
	end
	
	def destroy?
		user.try(:admin?) or user.is_a?(Doctor)
	end
end