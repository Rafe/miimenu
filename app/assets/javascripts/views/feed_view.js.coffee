Miimenu.Views.FeedView = Backbone.View.extend({
  className: "feed clearfix"
  tagName: "div"
  
  template: JST["templates/recipes/feed"]

  render: ()->
    $(@el).html(@template(@model.toJSON()))
    @$("abbr.timeago").timeago()
    this

  initialize:()->
    _.bindAll(this,"render")

})
