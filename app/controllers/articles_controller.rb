class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to root_path
  end

  def edit
    @article = find(params[:id])
  end

  def update
    @article = find(params[:id])
    @article.update(article_params)
    redirect_to article_path
  end

  def destroy
    @article = find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  private

  def find(id)
    Article.find(id)
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
