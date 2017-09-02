class SearchForm extends Components.Base
  refs:
    searchForm: "#q_title_or_text_cont"

  config:
    searchUrl: "/articles?utf8=✓&q%5Btitle_or_text_cont%5D=:text&commit=Search"

  bindings: ->
    @$refs.searchForm.on "input", @_showArticles

  _showArticles: (event) =>
    $.ajax
      url: @config.searchUrl.replace(":text", event.currentTarget.value)
      type: "GET"
      dataType: "json"
      success: (response) =>
        console.log "3"

$ ->
  new SearchForm($el) for $el in $(".js-articles-search-form")
