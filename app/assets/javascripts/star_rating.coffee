class App.StarRating extends App.Component

  bindings: ->
    @$el.on "click", @submitHandle

  submitHandle: =>
    original_url = @$el.context.URL.split("/");
    article_id = original_url[original_url.length - 1];
    url = "/users/articles/#{article_id}/ratings"

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
