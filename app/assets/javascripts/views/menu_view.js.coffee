Miimenu.Views.MenuView = Backbone.View.extend({
  el:'#menu'

  initialize : (models)->
    _.bindAll(this, "render")
    @recipes = models
    @recipes.bind("reset",@render)

  render : ()->
    el = $(@el)
    _.each @recipes.models, (model)->
      view = new Miimenu.Views.EntryView({model:model})
      el.append(view.render().el)

})
