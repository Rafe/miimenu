$ ->
  $(".menu-button").click (e)->
    $(".menu").toggle()

  $("#add-ingredients").click ()->
    id = $('.ingredient').length - 1
    $(".edit-ingredients").append("
      <div class='ingredient'>
        <input id='recipe_ingredients_attributes_#{id}_name'
               name='recipe[ingredients_attributes][#{id}][name]' 
               size='30' type='text'> 
        <input id='recipe_ingredients_attributes_#{id}_quantity' 
               name='recipe[ingredients_attributes][#{id}][quantity]' 
               size='30' type='text'>
        <a class='delete-ingredient'>[delete]</a>
      </div>
    ")

  $(".delete-ingredient").live("click",(e)->
    $(e.target).parent().remove()
  )

