class OrderedMedicinePolicy < ApplicationPolicy
 class Scope < Scope
  attr_reader :user, :order
    def resolve
      if user.try(:admin?)
        scope.all
	  elsif user.is_a?(Pharmacist)
        scope.all
	  elsif user.is_a?(User)
        scope.where(user_id: @order.user_id)
	  else
		raise Pundit::NotAuthorizedError
      end
	end
  end

	def index?
		user.is_a?(Pharmacist) or user.is_a?(User)
	end
	
	def new?
		user.is_a?(User) and !record.order.completed? and !record.order.pending?
	end
	
	def show?
		user.is_a?(Pharmacist) or user.is_a?(User)
	end
	
	def create?
		user.is_a?(User) and !record.order.completed? and !record.order.pending?
	end
	
	def update?
		user.is_a?(User) and !record.order.completed? and !record.order.pending?
	end
	
	def destroy?
		user.is_a?(User) and !record.order.completed? and !record.order.pending?
	end
end

