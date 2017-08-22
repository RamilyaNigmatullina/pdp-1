class App.StarRating extends App.Component
  # refs:
    # sField: ".rating"
    # scoreValue: "input[name='rating[score]']"

  bindings: ->
    @$el.on "click", @submitHandle

  submitHandle: =>
    url = "/users/ratings"

    $.ajax(
      url: url
      method: "post"
      data: @data()
      dataType: "json"
      type: "POST"
    )

  data: =>
    {
      rating: {
        score: "5"
      }
    }
