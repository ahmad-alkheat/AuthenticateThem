module Subscribem
  class ApplicationController < ActionController::Base

  	def current_user
  		if user_signed_in?
  			@current_user ||= begin 
  				user_id = env["warden"].user(:scope => :user)
  				Subscribem::User.find(user_id)
  			end
  		end
  	end
  	helper_method :current_user

  	def current_account
  		if user_signed_in?
  			@current_account ||= begin 
  				account_id = env["warden"].user(:scope => :account)
  			end
  		end
  	end
  	helper_method :current_acount

  	def user_signed_in?
  		env["warden"].authenticated?(:user)
  	end
  	helper_method :user_signed_in?
  end
end
