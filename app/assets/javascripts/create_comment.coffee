class App.CreateComment extends App.Component
  refs:
    commentField: "#comment_text"

  bindings: ->
    @$el.on "submit", @submitHandle

  submitHandle: (event) =>
    event.preventDefault()
    @$el.prop("disabled", false)

    url = @$el.attr("action")

    $.ajax(
      url: url
      method: "post"
      data: @data()
      dataType: "json"
      type: "POST"
      success: @successHandler
      @_clearField()
    )

  data: =>
    {
      comment: {
        text: @$refs.commentField.val()
      }
    }

  _clearField: =>
    @$refs.commentField.val("")

  successHandler: =>
    @$refs.commentField.val("")
