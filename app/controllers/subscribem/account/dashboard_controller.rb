require_dependency "subscribem/application_controller"

module Subscribem
  class Account::DashboardController < Subscribem::ApplicationController
  	before_filter :authenticate_user!

  	def index
  	end
  	
  end
end
