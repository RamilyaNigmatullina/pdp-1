class App.ManageComment extends App.Component
  refs:
    editLink: ".comment__edit"
    destroyLink: ".comment__destroy"
    commentText: ".comment__text"

  bindings: ->
    @$refs.editLink.on "click", @editCommentHandle
    @$refs.destroyLink.on "click", @destroyCommentHandle

  destroyCommentHandle: (event) =>
    event.preventDefault()

    url = @$refs.destroyLink.attr("href")

    $.ajax(
      url: url
      method: "delete"
      dataType: "json"
      type: "POST"
    )

  editCommentHandle: () =>
    event.preventDefault()

    url = @$refs.editLink.attr("href")
    @$refs.editLink.hide()

    @$refs.commentText.html(JST["templates/comment_form"])
