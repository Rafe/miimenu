module ActionHelper
  def like_button(recipe,attr={})
    button_to("Like",like_recipe_path(recipe),attr) unless current_user.liked?(recipe)
  end

  def cook_button(recipe,attr={})
    button_to("Cook",cook_recipe_path(recipe),attr) unless current_user.cooking?(recipe)
  end
end
