class RecipesController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:tab] == "all"
      @recipes = Recipe.includes(:ingredients).page(params[:page]).per(10)
    else
      @recipes = current_user.feed.includes(:ingredients,:author).page(params[:page]).per(10)
    end
    @recipes.each {|r| r.current_user = current_user }
    @entries_response = current_user.to_make_in_json
    @recipes_response = ActiveSupport::JSON.encode(@recipes)
    respond_to do |format|
      format.html
      format.js {render json: @recipes_response}
    end
  end

  def show
    @entries_response = current_user.to_make_in_json if current_user
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
    respond_to do |format|
      format.js { render json: {status: "success", likes: @recipe.likes } }
    end
  end

  #depreciates
  def cook 
    @recipe = Recipe.find(params[:id])
    current_user.cook!(@recipe)
    redirect_to request.referer
  end
end
