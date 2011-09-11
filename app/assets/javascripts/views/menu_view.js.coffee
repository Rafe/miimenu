Miimenu.Views.MenuView = Backbone.View.extend({
  el:'#menu'

  initialize : (models,feedsView)->
    _.bindAll(this, "render","add")
    @entries = models
    @entries.bind("reset",@render)
    @entries.bind("destroy",feedsView.refresh) if feedsView?

  render : ()->
    el = $(@el)
    _.each @entries.models, (model)->
      view = new Miimenu.Views.EntryView({model:model})
      el.append(view.render().el)

  add :(model)->
    @entries.add(model)
    view = new Miimenu.Views.EntryView({model:model})
    $(@el).prepend(view.render().el)

})
