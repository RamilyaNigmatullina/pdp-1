class ArticlesController < ApplicationController
  expose_decorated :articles, -> { paginated_articles }
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }

  helper_method :current_user_rating

  def index
    @q = Article.ransack(params[:q])
  end

  def show
  end

  private

  def paginated_articles
    Article.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end

  def current_user_rating
    @rating ||= article.ratings.find_by(user: current_user)
    @rating ? @rating.score : 0
  end
end
