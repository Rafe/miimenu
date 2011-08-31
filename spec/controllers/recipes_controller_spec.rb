require 'spec_helper'

describe RecipesController do
  render_views

  before do 
    @user = Factory(:user)
    @recipe = Factory(:recipe,:author => @user)
    sign_in @user
  end

  describe "GET 'show'" do

    it "should return single recipe" do
      Recipe.should_receive(:find).with("123").and_return(@recipe)

      get :show , :id => 123
      assigns[:recipe] == @recipe
      response.should be_success
    end
  end

  describe "GET 'index'" do

    it "should return interesting recipes" do
      @user.stub_chain(:page,:per).and_return([@recipe])

      get :index , :tab => "interesting"
      assigns[:recipes] == [@recipe]
      response.should be_success
    end

    it "should return user's feed" do
      @user.stub_chain(:feed,:page,:per).and_return([@recipe])

      get :index
      assigns[:recipes] == [@recipe]
      response.should be_success
    end
  end

  describe "GET 'new'" do

    it "should be able to create new recipe" do
      @user.stub_chain(:recipes,:new).and_return(@recipe)
      get :new
      assigns[:recipe] == @recipe 
      response.should be_success
    end
  end

  describe "GET 'edit'" do

  end

  describe "POST 'update'" do

  end

  describe "POST 'destory'" do

  end
end
