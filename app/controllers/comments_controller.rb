class CommentsController < ApplicationController
  
  def index 
    render :text => "index comment #{params['recipe_id']}"
  end

  def create 
    render :text => params
  end

  def destroy 
  end
end
