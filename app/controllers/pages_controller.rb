class PagesController < ApplicationController

  def index
    if current_user
      @recipes = current_user.feed 
      render @recipes
    end
  end
end
