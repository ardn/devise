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
			redirect_to posts_path
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
