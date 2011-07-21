class RecipesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index,:show]

  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.build(params[:recipe])
    if @recipe.save
      redirect_to @recipe
    else
      redirect_to root_path
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
end
