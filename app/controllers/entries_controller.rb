class EntriesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js

  def create
    @recipe = Recipe.find(params[:entry][:recipe_id])
    current_user.cook!(@recipe)
    redirect_back_or root_path
  end

  def destroy
    Entry.joins(:menu).where("menus.owner_id = ?",current_user.id).first.destroy
    redirect_back_or root_path
  end

end
