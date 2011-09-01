class MenusController < ApplicationController

  def create 
    current_user.menus.create(:name => params[:name])
    redirect_back_or root_path
  end

  def destroy
    current_user.menus.find(params[:id]).destroy
    redirect_back_or root_path
  end

end
