require 'spec_helper'

describe EntriesController do

  before do
    request.env["HTTP_REFERER"] = "/"
    @user = Factory(:user)
    @recipe = Factory(:recipe,:author => @user)
    sign_in @user
  end

  describe "POST create" do

    it "should add recipe to menu" do
      lambda do
        post :create ,{:entry => {:recipe_id => @recipe.id}}
      end.should change(Entry,:count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "should delete entry in menu" do 
      @user.entries.create(:recipe_id => @recipe.id,:menu => "To make")
      lambda do 
        delete :destroy ,:id => @recipe.id
      end.should change(Entry,:count).by(-1)
    end
  end
end
