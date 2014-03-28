class HomeController < ApplicationController

	def index
	end
	

	def search

		@users = User.where(fname: params[:query])
	end

end
