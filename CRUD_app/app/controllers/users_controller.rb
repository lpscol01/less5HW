class UsersController < ApplicationController
	def index
		@users = User.all
		flash[:notice] = "Look! These are your users..."
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy

		@user = User.find(params[:id])
		if @user && @user.destroy
			flash[:notice] = "Your user has been deleted."
		else
			flash[:alert] = "There was an issue deleting that user..."
		end
		redirect_to "/users"
	end

	def new
		@user = User.new
		puts "hey good lookin'..."
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:notice] = "Your account was created!"
		else
			flash[:alert] = "There was a problem creating your account" 
		end
		redirect_to root_path

	end
	
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user && @user.update_attributes(params[:user])
			flash[:notice] = "Changes made - good to go!"
			redirect_to user_path(@user)
		else
			flash[:alert] = "Uh Oh - there was an issue with with your updates" 
			redirect_to :back
		end
	end

end