Miimenu.Models.Recipes = Backbone.Collection.extend({
  model: Miimenu.Models.Recipe
  url:"/recipes"

  initialize:()->
    @page = 2
    _.bindAll(@,"more")

  more: ()->
    @fetch(
      data: {page:@page,tab:$.urlParam('tab')}
      add:true
    )
    @page += 1
})
