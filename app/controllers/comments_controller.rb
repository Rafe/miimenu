class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  
  def index 
    comments = Comment.where(:recipe_id => params[:recipe_id])
    render json: comments.to_json
  end

  def create 
    comment = current_user.comments.new(
      :text => params['comment']['text'],
      :recipe_id => params["recipe_id"])
    if comment.valid?
      comment.save!
    else
      flash[:notice] = "comment error" 
    end
    redirect_to recipe_path(params["recipe_id"])
  end

  def destroy 
    comment = Comment.find(params[:id])
    comment.destroy if comment && comment.commenter.id == current_user.id
    redirect_to recipe_path(params["recipe_id"])
  end
end
