class CommentDecorator < ApplicationDecorator
  delegate :text

  def time_created_in_words
    h.time_ago_in_words(object.created_at)
  end
end
