class CommentsController < ApplicationController
  
  def index 
    render :text => "index comment #{params['recipe_id']}"
  end

  def create 
    comment = current_user.comments.new(:text => params['comment']['text'],:recipe_id => params["recipe_id"])
    if comment.valid?
      comment.save!
    else
      flash[:notice] = "comment error" 
    end
    redirect_to recipe_path(params["recipe_id"])
  end

  #should check user authentication
  def destroy 
    comment = Comment.find(params[:id])
    comment.destroy if comment && comment.commenter.id == current_user.id
    redirect_to recipe_path(params["recipe_id"])
  end
end
