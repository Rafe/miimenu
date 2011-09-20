class Miimenu.Views.FeedView extends Backbone.View
  className: "feed clearfix"
  tagName: "div"
  
  template: JST["templates/recipes/feed"]

  events:
    "click .like-button":"like"
    "click .cook-button":"cook"
    "mouseover .author-view":"setUserView"

  render: ()->
    $(@el).html(@template(@model.toJSON()))
    @$("abbr.timeago").timeago()
    this

  initialize:()->
    _.bindAll(this,"render","like","cook")
    @model.bind("change",@render)

  setUserView:()->
    return if @userView
    model = new Miimenu.Models.User(id:@model.get("author").id)
    console.log(model.id)
    view = @
    @userView = new Miimenu.Views.UserView({model:model})
    model.fetch(
      success:()->
        view.$(".overlay").html(view.userView.render().el)
    )

  like:()->
    view = @
    @model.like({
      success:(data)->
        view.model.set({likes: data.likes,is_liked:true })
    })

  cook:()->
    view = @
    menu = @menu
    @menu.add(new Miimenu.Models.Entry(@model.toJSON()))
    @model.set(
      is_cooking:true
    )
    @model.cook({
      success:(model,resp)->
        #view.model.set(model)
        #menu.add(model)
    })
