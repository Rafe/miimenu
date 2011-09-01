require 'spec_helper'

describe MenusController do

  before do
    @user = Factory(:user)
    @recipe = Factory(:recipe,:author => @user)
  end

  context "authorized" do
    before do
      sign_in @user
    end

    describe "POST create" do
      it "should create a new menu" do 
        test = "test"
        lambda do
          post :create, :name => test
        end.should change(Menu,:count).by(1)
      end
    end

    describe "DELETE destroy" do
      it "should delete the menu" do
        menu = @user.menus.create()
        lambda do
          delete :destroy, :id => menu.id
        end.should change(Menu,:count).by(-1)
      end
    end
  end
end
