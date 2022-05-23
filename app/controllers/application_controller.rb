class ApplicationController < ActionController::Base
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	
	def user_not_authorized
		flash[:alert] = "You are not authorized to perform this action."
		redirect_back(fallback_location: root_path)
	end
	
	def pundit_user
		
		if doctor_signed_in?
			current_doctor
		elsif pharmacist_signed_in?
			current_pharmacist
		else
			current_user
		end
	end
end