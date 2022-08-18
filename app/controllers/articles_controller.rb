class ArticlesController < ApplicationController
	def index
		@obj=Article.all
	end
	def about
	
	end
	def show
		@article=Article.find(params[:id])
	end
	def new
		@article=Article.new
	end
	def create
		@article=Article.new(params.require(:article).permit(:title,:body))
		# @article.save
		# redirect_to article_path(@article)
		# render plain: @article.inspect
		if @article.save
			flash[:notice]="Successfully Created the article"
			redirect_to article_path(@article)
		else
			render 'new' 
		end
	end
	def update
		@article=Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title,:body))
			flash[:notice]="Successfully Created the article"
			redirect_to article_path(@article)
		else 
			render 'edit'
		end
	end

	def destroy
		@article=Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end
end