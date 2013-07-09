class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :custom_user_auth, only: [:front]

	def custom_user_auth
    unless user_signed_in?
    	redirect_to('/users/sign_in')
    end
	end

	def authenticate_admin_user!
		raise SecurityError unless current_user.try(:admin?)
	end
end
