class ArticlesController < ApplicationController
  expose_decorated :articles, -> { paginated_articles }
  expose_decorated :article

  def index
  end

  def show
  end

  private

  def paginated_articles
    Article.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
  end
end
