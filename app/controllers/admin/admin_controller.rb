class Admin::AdminController < ActionController::Base
	include SessionsHelper

	layout "admin"

	before_action :check_admin

	def check_admin
		if current_user.blank? || current_user.user?
			redirect_to root_url
		end
	end		
end
