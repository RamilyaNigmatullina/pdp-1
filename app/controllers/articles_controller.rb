class ArticlesController < ApplicationController
  expose_decorated :articles, -> { fetch_articles }
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }

  helper_method :current_user_rating

  respond_to :html, :json

  def index
    respond_with articles
  end

  def show
  end

  private

  def fetch_articles
    Article
      .includes(:user)
      .ransack(params[:query])
      .result(distinct: true)
      .order(created_at: :desc)
      .page(params[:page]).per(10)
  end

  def current_user_rating
    @rating ||= article.ratings.find_by(user: current_user)
    @rating ? @rating.score : 0
  end
end
