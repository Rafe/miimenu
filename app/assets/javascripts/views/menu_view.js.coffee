Miimenu.Views.EntryView = Backbone.View.extend({
  className:"entry clearfix"

  template:JST["templates/recipes/entry"]

  events:
    "click .delete-button":"destroy"

  render: ()->
    $(this.el).html(@template(@model.toJSON()))
    this

  initialize:()->
    _.bindAll(this,"destroy","render")

  destroy: ()->
    @model.destroy()
    this.remove()
    false

})

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
