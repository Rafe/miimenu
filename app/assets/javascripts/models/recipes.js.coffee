Miimenu.Models.Recipes = Backbone.Collection.extend({
  model: Miimenu.Models.Recipe
  url:"/recipes"

  initialize:()->
    @page = 2
    _.bindAll(@,"more")

  more: (options)->
    length = @models.length
    @fetch(
      data: {page:@page,tab:$.urlParam('tab')}
      add:true
      success:(models)->
        options.end() if length is models.length
    )
    @page += 1
})
