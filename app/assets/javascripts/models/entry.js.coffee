class Miimenu.Models.Entry extends Backbone.Model
  urlRoot:"/entries"

class Miimenu.Models.Entries extends Backbone.Collection
  model: Miimenu.Models.Entry
  url: "/entries"
