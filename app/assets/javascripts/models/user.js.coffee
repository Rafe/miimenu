Miimenu.Models.User = Backbone.Model.extend({
  urlRoot:"/users"

  initialize:()->
    _.bindAll(@,"follow","unfollow","action")

  follow:(options)->
    @fetch(
      success:(data)->
        console.log data
    )
    @action("follow",options)

  unfollow:(options)->
    @action("unfollow",options)

  action:(name,options)->
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    $.ajax({
      type:"post"
      dataType:"json"
      url:"#{@urlRoot}/#{@id}/#{name}"
      beforeSend:(xhr,setting) ->
        xhr.setRequestHeader("X-CSRF-Token",csrf_token)
      success:options.success
    }).error((xhr,status,errorThrown)->
      console.log("#{xhr},{#status},#{errorThrown}")
    )
})
