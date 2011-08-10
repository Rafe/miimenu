class MenusController < ApplicationController

  def create 
    id = params[:menu][:recipe_id]
    unless id.nil?
      current_user.menus.create(:recipe_id => id)
    end
    redirect_to recipes_path
  end

  def destroy
    current_user.menus.find_by_recipe_id(params[:id]).destroy
    redirect_to recipes_path
  end

end
