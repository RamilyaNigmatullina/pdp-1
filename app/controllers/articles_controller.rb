class ArticlesController < ApplicationController
  expose_decorated :articles, -> { Article.all }
  expose_decorated :article

  def index
  end

  def show
  end
end
