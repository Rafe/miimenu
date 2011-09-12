class Miimenu.Models.Recipe extends Backbone.Model
  urlRoot:"/recipes"

  initialize:()->
    _.bindAll(@,"like","cook")

  cook:(options)->
    entry = new Miimenu.Models.Entry()
    entry.save({
      recipe_id : @id
    },{
      success:(model,resp)->
        options.success(model,resp)
    })

  like:(options)->
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    $.ajax({
      type:"post"
      dataType:"json"
      url:"/recipes/#{@id}/like"
      beforeSend:(xhr,setting) ->
        xhr.setRequestHeader("X-CSRF-Token",csrf_token)
    }).success((data)->
      options.success(data)
    ).error((xhr,status,errorThrown)->
      console.log("#{xhr},{#status},#{errorThrown}")
    )
