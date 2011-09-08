class Miimenu.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    @menuModel = new Miimenu.Models.Recipes()
    @feedModel = new Miimenu.Models.Recipes()
    @menuView = new Miimenu.Views.MenuView(@menuModel)
    @feedView = new Miimenu.Views.FeedsView(@feedModel)

    
