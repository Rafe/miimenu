class MenusController < ApplicationController
  before_filter :authenticate_user!

  def create 
    current_user.entries.create(:name => params[:name])
    redirect_to request.referer
  end

  def destroy
    current_user.menus.find(params[:id]).destroy
    redirect_to request.referer
  end

end
