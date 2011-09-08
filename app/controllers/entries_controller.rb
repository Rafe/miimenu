class EntriesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

  def index
    render json: current_user.to_make
  end

  def create
    @recipe = Recipe.find(params[:entry][:recipe_id])
    current_user.cook!(@recipe)
    redirect_to request.referer
  end

  def destroy
    current_user.entries.find_by_recipe_id(params[:id]).destroy
    render json: {status: "success"}
  end

end
