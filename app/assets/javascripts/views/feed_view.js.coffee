Miimenu.Views.FeedView = Backbone.View.extend({
  className: "feed clearfix"
  tagName: "div"
  
  template: JST["templates/recipes/feed"]

  events:
    "click .like-button":"like"
    "click .cook-button":"cook"

  render: ()->
    $(@el).html(@template(@model.toJSON()))
    @$("abbr.timeago").timeago()
    this

  initialize:()->
    _.bindAll(this,"render","like","cook")
    @model.bind("change",@render)

  like:()->
    view = @
    @model.like({
      success:(data)->
        view.model.set({likes: data.likes,is_liked:true })
    })

  cook:()->
    view = @
    menu = @menu
    @model.cook({
      success:(model,resp)->
        view.model.set(model)
        menu.add(model)
    })
})
