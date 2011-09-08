Miimenu.Models.Recipe = Backbone.Model

Miimenu.Models.Recipes = Backbone.Collection.extend({
  model: Miimenu.Models.Recipe
  url:"/entries"
})
