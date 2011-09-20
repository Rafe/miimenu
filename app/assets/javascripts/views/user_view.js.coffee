class Miimenu.Views.UserView extends Backbone.View
  template : JST["templates/users/user"]
  className: "user-view"

  events:
    "click .follow-button":"follow"
    "click .unfollow-button":"unfollow"

  initialize :() ->
    _.bindAll(@,"render","follow","unfollow","setFollowButton","setUnfollowButton")

  render:()->
    $(@el).html(@template(@model.toJSON()))
    console.log(@model.get("is_followed"))
    if @model.get("is_you") is true
      @$(".follow-area").html("Is You!")
    else if @model.get("is_followed") is true
      @setUnfollowButton()
    else
      @setFollowButton()
    this

  setFollowButton:()->
    @$(".follow-area").html("<button class='follow-button'>follow</button>")

  setUnfollowButton:()->
    @$(".follow-area").html("<button class='unfollow-button'>unfollow</button>")

  follow:()->
    view = @
    @model.follow(
      success:(data) ->
        console.log(data)
        view.setUnfollowButton()
    )

  unfollow:()->
    view = @
    @model.unfollow(
      success:(data) ->
        console.log(data)
        view.setFollowButton()
    )

