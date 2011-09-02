class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => :show

  def index
    if params[:tab] == "interesting"
      @recipes = Recipe.includes(:ingredients).page(params[:page]).per(10)
    else
      @recipes = current_user.feed.includes(:ingredients).page(params[:page]).per(10)
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
    if @recipe.update_attributes(params[:recipe])
      redirect_to recipe_path(@recipe)
    else
      render action: :edit
    end    
  end

  def destroy
    Recipe.find(params[:id]).destroy
  end

  def search
    @recipes = Recipe.search_for(params[:q]).page(params[:page]).per(10)
  end

  def like
    @recipe = Recipe.find(params[:id])
    current_user.like!(@recipe)
    redirect_back_or root_path
  end

  def cook 
    @recipe = Recipe.find(params[:id])
    current_user.cook!(@recipe)
    redirect_back_or root_path
  end
end
