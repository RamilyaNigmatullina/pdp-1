class ArticlesController < ApplicationController
  expose_decorated :articles
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }

  helper_method :current_user_rating

  respond_to :html, :json

  def index
    @q = ransack_params
    self.articles = ransack_result
    respond_with articles
  end

  def show
  end

  private

  def current_user_rating
    @rating ||= article.ratings.find_by(user: current_user)
    @rating ? @rating.score : 0
  end

  def ransack_params
    Article.includes(:user).ransack(params[:q])
  end

  def ransack_result
    @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end
end
