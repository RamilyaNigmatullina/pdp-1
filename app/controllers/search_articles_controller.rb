class SearchArticlesController < ApplicationController
  respond_to :json

  expose :articles

  def index
    @search = ransack_params
    self.articles = ransack_result
    render json: articles
  end

  private

  def ransack_params
    Article.includes(:user).ransack(params[:q])
  end

  def ransack_result
    @search.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10)
  end
end
