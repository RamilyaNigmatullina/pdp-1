class App.CreateComment extends App.Component
  refs:
    commentField: "#comment_text"
    submitButton: "input[type='submit']"

  bindings: ->
    @$el.on "submit", @submitHandle

  submitHandle: (event) =>
    event.preventDefault()

    url = @$el.attr("action")

    $.ajax(
      url: url
      method: "post"
      data: @data()
      dataType: "json"
      type: "POST"
      success: @successHandler
      @_allowSubmit()
      @_clearField()
    )

  data: =>
    {
      comment: {
        text: @$refs.commentField.val()
      }
    }

  successHandler: =>
    @_allowSubmit()
    @_clearField()

  _clearField: =>
    @$refs.commentField.val("")

  _allowSubmit: =>
    @$refs.submitButton.removeAttr("disabled")
