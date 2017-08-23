class ArticlesController < ApplicationController
  expose_decorated :articles, -> { paginated_articles }
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }
  # expose(:article_rating) { article_rating }

  def index
  end

  def show
  end

  private

  def paginated_articles
    Article.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  # def article_rating
  #   ratings = Rating.where(article: article)
  #   ratings.sum(&:score) / ratings.count
  # end
end
