class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit	
		@article = Article.find(params[:id])
	end
	
	def create
		@article = Article.new(params.require(:article).permit(:title, :description))
		if @article.save
			flash[:notice] = "Article was created successfully"
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Article was updated successfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		
		@article = Article.find(params[:id])
		if @article.destroy
			flash[:notice] = "Article was deleted successfully"
			redirect_to articles_path
		else
			render 'index'
		end
	end

end