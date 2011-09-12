class Miimenu.Views.EntryView extends Backbone.View
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
