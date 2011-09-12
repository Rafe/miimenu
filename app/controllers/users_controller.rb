class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user.current_user = current_user
    @recipes = @user.recipes.page(params[:page]).per(10) 
    respond_to do |format|
      format.html
      format.js { render json: @user.to_json( methods: [:id,:is_followed]) }
    end
  end

  def index
    @users = User.page(params[:page])
  end

  def follow 
    follower = current_user.follow!(params[:id])
    render json: { status: follower.valid? }
  end

  def unfollow
    status = current_user.unfollow!(params[:id])
    render json: { status: status }
  end
end
