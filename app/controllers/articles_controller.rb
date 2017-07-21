class ArticlesController < ApplicationController
  expose_decorated :articles, -> { Article.includes(:user) }
  expose_decorated :article

  def index
  end

  def show
  end
end
