class Miimenu.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    @menuModel = new Miimenu.Models.Entries()
    @feedsModel = new Miimenu.Models.Recipes()
    @feedsView = new Miimenu.Views.FeedsView(@feedsModel)
    @menuView = new Miimenu.Views.MenuView(@menuModel,@feedsView)
    @feedsView.menu = @menuView

    
