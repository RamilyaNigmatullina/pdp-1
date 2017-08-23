class ArticleRating extends Components.Base
  refs:
    starRatingItem: ".js-star-rating-item"

  config:
    ratingUrl: "/users/articles/:article_id/ratings"

  initialize: ->
    window.q = @
    @articleId = @$el.data("id")

  bindings: ->
    @$refs.starRatingItem.click @_updateArticleRating

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
        @_updateAverageRating(rating)
        @_updateStars(rating)

  _updateAverageRating: (rating)=>
    console.log("_updateAverageRating", rating)

  _updateStars: (rating) =>
    @$refs.starRatingItem.removeClass("rating-active")
    @$refs.starRatingItem.slice(0, rating).addClass("rating-active")


$ ->
  new ArticleRating($el) for $el in $(".js-article-rating")
