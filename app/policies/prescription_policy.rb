class PrescriptionPolicy < ApplicationPolicy
  class Scope < Scope
  attr_reader :user, :prescription

	def initialize(user, prescription)
		@user = user
		@prescription = prescription
	end
	
    def resolve
	  if user == nil
		raise Pundit::NotAuthorizedError
      elsif user.try(:admin?)
        scope.all
	  elsif user.class.table_name == "doctors"
        scope.where(prescription_id: @user.prescription_ids)
	  else
		raise Pundit::NotAuthorizedError
      end
	end
  end
	def index?
		user.try(:admin?) or user.class.table_name == "doctors"
	end
	
	def new?
		user.try(:admin?) or user.class.table_name == "doctors"
	end
	
	def show?
		user.try(:admin?) or user.class.table_name == "doctors"
	end
	
	def create?
		user.try(:admin?) or user.class.table_name == "doctors"
	end
	
	def update?
		user.try(:admin?) or user.class.table_name == "doctors"
	end
	
	def destroy?
		user.try(:admin?) or user.class.table_name == "doctors"
	end
end