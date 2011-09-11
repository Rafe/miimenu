Miimenu.Models.Entry = Backbone.Model.extend({
  urlRoot:"/entries"
})

Miimenu.Models.Entries = Backbone.Collection.extend({
  model: Miimenu.Models.Entry
  url: "/entries"
})
