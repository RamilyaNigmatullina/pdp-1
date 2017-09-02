class ArticlesController < ApplicationController
  expose_decorated :articles
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }
  expose(:rating) { Rating.new }

  helper_method :current_user_rating

  def index
    @q = Article.ransack(params[:q])
    self.articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    respond_to do |format|
      format.html {
        render :index
      }
      format.json {
        render json: articles
      }
    end
  end

  def show
  end

  private

  def current_user_rating
    @rating ||= article.ratings.find_by(user: current_user)
    @rating ? @rating.score : 0
  end
end
