Miimenu.Views.AuthorView = Backbone.View.extend({
  template : JST["templates/users/author"]
  className: "user-view"

  events:
    "click .follow-button":"follow"
    "click .unfollow-button":"unfollow"
    "mouseover .photo":"showAuthor"
    "mouseout .photo":"hideAuthor"

  initialize :(model) ->
    _.bindAll(@,"render","showAuthor","hideAuthor","follow","unfollow","setFollowButton")
    @model = new Miimenu.Models.User(model)
    @changed = false
    @show = true

  showAuthor :()->
    if @show is true
      @show = true
      @model.fetch(
        success:@render
      )
    @show = false

  hideAuthor :()->
    @show = true

  render:()->
    $(@el).html(@template(@model.toJSON()))
    @setFollowButton()
    this

  setFollowButton:()->
    if @model.get("is_followed") is true
      @$(".follow-area").html("<button class='unfollow-button'>unfollow</button>")
    else if @model.get("is_followed") is false
      @$(".follow-area").html("<button class='follow-button'>follow</button>")
    else
      @$(".follow-area").html("")

  follow:()->
    view = @
    @model.follow(
      success:(data)->
        console.log data
        view.setFollowButton()
    )

  unfollow:()->
    view = @
    @model.unfollow(
      success:(data)->
        console.log data
        view.setFollowButton()
    )
})
