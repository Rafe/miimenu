require 'spec_helper'

describe EntriesController do

  before do
    @user = Factory(:user)
    @recipe = Factory(:recipe,:author => @user)
    @menu = @user.menus.create()
    sign_in @user
  end

  describe "POST create" do

    it "should add recipe to menu" do
      lambda do
        post :create ,{:entry => {:recipe_id => @recipe.id}}
      end.should change(Entry,:count).by(1)
      response.should redirect_to(root_path)
    end
  end

  describe "DELETE destroy" do
    it "should delete entry in menu" do 
      @menu.entries.create(:recipe => @recipe)
      lambda do 
        delete :destroy ,:id => @recipe.id
      end.should change(Entry,:count).by(-1)
      response.should redirect_to(root_path)
    end
  end
end