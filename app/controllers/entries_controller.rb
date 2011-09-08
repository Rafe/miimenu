class EntriesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

  def index
    @entries = current_user.to_make.recipes
    render json: @entries
  end

  def create
    @recipe = Recipe.find(params[:entry][:recipe_id])
    current_user.cook!(@recipe)
    redirect_to request.referer
  end

  def destroy
    Entry.joins(:menu).where("menus.owner_id = ? and entries.recipe_id = ?",current_user.id,params[:id]).first.destroy
    render text: "success"
  end

end
