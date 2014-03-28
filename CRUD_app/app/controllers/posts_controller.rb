class PostsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		flash[:notice] = "Here are all the user posts."
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@user = User.find(params[:user_id])
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = params[:user_id]
		if @post.save
			flash[:notice] = "Your post has been saved."
			redirect_to user_post_path(@post.user, @post)
		else
			flash[:alert] = "Your post was unable to be saved."
			redirect_to :back
		end
	end

	def edit
		@post = Post.find(params[:id])

	end

	def update
		@post = Post.find(params[:id])
		if @post && @post.update_attributes(params[:post])
			flash[:notice] = "You post has been updated!"
		else
			flash[:alert] = "There was an issue updating your post."
		end
		redirect_to user_post_path(@post.user, @post)
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "You post has been updated!"
			redirect_to user_post_path(@post.user)
		else
			flash[:alert] = "There was an issue updating your post."
			redirect_to :back
		end
		
	end
end