module Users
  class CommentsController < Users::BaseController
    expose(:article)
    expose_decorated(:comments) { Comment.by_article(article) }
    expose(:comment, parent: :article)

    def create
      comment.user = current_user
      self.comment = new_comment if comment.save
      render "articles/fragments"
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end

    def new_comment
      article.comments.build
    end
  end
end
