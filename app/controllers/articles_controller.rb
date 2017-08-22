class ArticlesController < ApplicationController
  expose_decorated :articles, -> { paginated_articles }
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }

  def index
  end

  def show
  end

  private

  def paginated_articles
    Article.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end
end
