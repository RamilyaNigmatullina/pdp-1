class SearchArticlesController < ApplicationController
  respond_to :json

  expose :articles

  def index
    @q = Article.ransack(params[:q])
    self.articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    render json: articles
  end
end
