class CategoriesController < ApplicationController
	
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		# @pages = @category.posts.comments.page params[:page]
	end

	def new
		@category = Category.new
			
	end

	def create
		@category = Category.new(params[:category].permit(:name, :desc))
		if @category.save
			redirect_to @category
		else
			render 'new'
		end
	end

	def edit
		@category = Category.find(params[:id])
		unauthorized! if cannot? :update, @category
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(params[:category].permit(:name, :text))
			redirect_to @category
		else
			render 'edit'
		end

	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		redirect_to posts_path 
		
	end


	private 
	def category_params
		params.require(:category).permit(:name, :desc)
		
	end

end

	# def new
	# 	@post = Post.new
		
	# end

	# def create
		
	# 	@post = Post.new(params[:post].permit(:title, :text))

	# 	if @post.save

	# 		redirect_to @post    
	# 	else
	# 		render 'new'
	# 	end

	# end

	# # def show
	# 	@post = Post.find(params[:id])
	# 	@pages = @post.comments.page params[:page]

	# end

	# def edit
	# 	@post = Post.find(params[:id])
	# 	# cancan
	# 	unauthorized! if cannot? :update, @post
		
	# end
	# def update
	# 	@post = Post.find(params[:id])

	# 	if @post.update(params[:post].permit(:title, :text))


	# 		redirect_to @post
	# 	else
	# # 		render 'edit'
	# # 	end

	# end
	
	# def destroy

		
	# 	@post = Post.find(params[:id])


	# 	@post.destroy

	# 	redirect_to posts_path

	# end

	

