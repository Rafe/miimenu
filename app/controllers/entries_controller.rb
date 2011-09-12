class EntriesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

  def index
    render json: current_user.to_make_in_json
  end

  def create
    @recipe = Recipe.find(params[:entry][:recipe_id])
    current_user.cook!(@recipe)
    @recipe.current_user = current_user
    render json: @recipe.to_json( methods: [:thumb_image,:likes,:is_liked,:is_cooking]) 
  end

  def destroy
    entry = current_user.entries.find_by_recipe_id(params[:id])
    entry.destroy if entry
    respond_to do |format|
      format.js { render json: {status: "success"} }
    end
  end

end
