class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.page(params[:page]).per(10) 
  end

  def index
    @users = User.page(params[:page])
  end

end
