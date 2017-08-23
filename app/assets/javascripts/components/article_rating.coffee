class ArticleRating extends Components.Base
  refs:
    startRatingItem: ".js-start-rating-item"

  config:
    ratingUrl: "/users/articles/:article_id/ratings"

  initialize: ->
    window.q = @
    @articleId = @$el.data("id")

  bindings: ->
    @$refs.startRatingItem.click @_updateArticleRating

  _updateArticleRating: (event) =>
    console.log event
    event.preventDefault()
    rating = event.currentTarget.dataset.rating
    $.ajax
      url: @config.ratingUrl.replace(":article_id", @articleId)
      type: "POST"
      dataType: "json"
      data:
        rating:
          score: rating
      success: (response) =>
        console.log(response)
        @_updateAverageRating()
        @_updateStars()

  _updateAverageRating: (rating)=>
    console.log("_updateAverageRating", rating)

  _updateStars: =>
    @$refs.startRatingItem.removeClass("rating-active")
    @$refs.startRatingItem.slice(0, rating).addClass("rating-active")


$ ->
  new ArticleRating($el) for $el in $(".js-article-rating")
