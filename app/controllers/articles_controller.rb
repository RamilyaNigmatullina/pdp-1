class ArticlesController < ApplicationController
  expose_decorated :articles, -> { Article.includes(:user) }
  expose_decorated :article

  expose_decorated(:comments) { article.comments }
  expose(:comment) { Comment.new(article: article) }

  def index
  end

  def show
  end
end
