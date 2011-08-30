class RecipesController < ApplicationController

  before_filter :authenticate_user!

  def index
    if params[:tab] == "interesting"
      @recipes = Recipe.page(params[:page]).per(10)
    else
      @recipes = current_user.feed.page(params[:page]).per(10)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.new
    @recipe.ingredients.new
  end

  def create
    @recipe = current_user.recipes.new(params[:recipe])
    if @recipe.save
      redirect_to @recipe
    else
      redirect_to new_recipe_path(@recipe.id)
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    Recipe.update_attributes!(params[:recipe])
  end

  def destroy
    Recipe.find(params[:id]).destroy
  end

  def search
    @recipes = Recipe.search_for(params[:q]).page(params[:page]).per(10)
  end
end
