Miimenu.Views.FeedsView = Backbone.View.extend({
  className : "recipes clearfix"
  tagName : "div"
  el : "#recipes-view"

  initialize:(feeds)->
    _.bindAll(this,"render")
    @feeds = feeds
    @feeds.bind("reset",@render)

  render : ()->
    el = $(@el)
    _.each(@feeds.models, (model)->
      view = new Miimenu.Views.FeedView({model:model})
      el.append(view.render().el)
    )
    console.log(el)

})
