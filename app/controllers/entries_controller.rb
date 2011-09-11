class EntriesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

  def index
    render json: current_user.to_make
  end

  def create
    @recipe = Recipe.find(params[:entry][:recipe_id])
    current_user.cook!(@recipe)
    @recipe.current_user = current_user
    render json: @recipe.to_json( methods: [:likes,:is_liked,:is_cooking]) 
  end

  def destroy
    current_user.entries.find_by_recipe_id(params[:id]).destroy
    respond_to do |format|
      format.js { render json: {status: "success"} }
    end
  end

end
