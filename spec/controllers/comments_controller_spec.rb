require 'spec_helper'

describe CommentsController do
  before do 
    @user = Factory(:user)
    @recipe = Factory(:recipe, :author => @user)
    sign_in @user
  end

  describe "POST create" do
    it "should create a new comments for recipe" do 
      lambda do 
        post :create,:recipe_id =>@recipe, :comment => {:text => "test"}
      end.should change(@recipe.comments,:count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "should destroy a comment if it is same user" do 
      comment = Factory(:comment,:commenter=>@user,:recipe => @recipe)
      lambda do
        delete :destroy , :id => comment, :recipe_id => @recipe
      end.should change(@recipe.comments,:count).by(-1)
    end
  end
end
