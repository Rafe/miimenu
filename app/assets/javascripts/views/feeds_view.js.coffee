class Miimenu.Views.FeedsView extends Backbone.View
  className : "recipes clearfix"
  tagName : "div"
  el : "#recipes-view"
  pageRange:10

  events:
    "click #more-button":"more"

  initialize:(feeds)->
    _.bindAll(this,"render","more","add","refresh")
    @feeds = feeds
    @feeds.bind("reset",@render)
    @feeds.bind("add",@add)

  render : ()->
    _.each(@feeds.models,@add)

  add : (model)->
    view = new Miimenu.Views.FeedView({model:model})
    view.menu = @menu
    @$(".recipe-area").append(view.render().el)

  more : ()->
    view = @
    @feeds.more(
      end:()->
        view.$("#more-button").hide()
    )

  refresh :(model)->
    feed = @feeds.get(model.id)
    feed.set({is_cooking:false}) if feed?

