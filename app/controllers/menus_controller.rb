class MenusController < ApplicationController

  def index 
    render current_user.entries
  end

  def create 
    entry = Recipe.find(params[:menu][:recipe_id])
    unless entry.nil?
      current_user.menus.create(:recipe => entry)
    end
    redirect_to recipes_path
  end

  def shopping
    @recipes = current_user.entries
    render 
  end
end
