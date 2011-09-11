Miimenu.Views.FeedsView = Backbone.View.extend({
  className : "recipes clearfix"
  tagName : "div"
  el : "#recipes-view"

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
    @feeds.more()

  refresh :(model)->
    feed = @feeds.get(model.id)
    feed.set({is_cooking:false}) if feed?

})
