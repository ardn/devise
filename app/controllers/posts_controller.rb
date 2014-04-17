class PostsController < ApplicationController

	# http_basic_authenticate_with name: "raj", password: "raj", except: [:index, :show]
	before_action :authenticate_test_user!, :except => [:index, :show]
	# load_and_authorize_resource 


	def index
		@posts = Post.all
binding.pry 
	end
	def new
		@post = Post.new
		
	end
	def create
		
		@post = Post.new(params[:post].permit(:title, :text))

		# @post = Post.new(post_params)
		# @post.user = current_test_user
		
		if @post.save

			redirect_to @post    
		else
			render 'new'
		end

	end

	def show
		@post = Post.find(params[:id])



	end

	def edit
		@post = Post.find(params[:id])
		# cancan
		unauthorized! if cannot? :update, @post
		
	end
	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text))


			redirect_to @post
		else
			render 'edit'
		end

	end
	
	def destroy

		
		@post = Post.find(params[:id])


		@post.destroy

		redirect_to posts_path

	end

	
	private 
	def post_params
		params.require(:post).permit(:title, :text)
		
	end
end
