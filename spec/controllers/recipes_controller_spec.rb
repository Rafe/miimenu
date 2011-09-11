require 'spec_helper'

describe RecipesController do
  render_views

  before do 
    request.env["HTTP_REFERER"] = "/"
    @user = Factory(:user)
    @recipe = Factory(:recipe,:author => @user)
    @user.stub!(:to_make).and_return([@recipe])
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

  describe "GET 'like'" do

    it "should increase the recipe likes count" do
      lambda do
        xhr :get, :like, :id => @recipe.id
        response.should be_success
        response.body.should == { status:"success", likes:1 }.to_json
      end.should change(@recipe,:likes).by(1)
      assigns[:recipe].should == @recipe
    end
  end

  describe "GET 'cook'" do
    it "should add recipe to menu" do
      @user.stub!(:cook!).with(@recipe)
      get :cook, :id => @recipe.id
      response.should redirect_to root_path
    end
  end

  describe "POST 'create'" do 
    before do 
      @attr = {
        :name => "test dish",
        :description => "test",
        :instructions => "test",
        :ingredients_attributes => [{:name => "food",:quantity => "100gram"}]
      }
    end

    it "should create a new recipe" do 
      lambda do
        post :create , :recipe => @attr
      end.should change(@user.recipes,:count).by(1)

      response.should redirect_to(Recipe.all.last)
    end
  end

  describe "GET 'edit'" do

  end

  describe "POST 'update'" do

  end

  describe "POST 'destory'" do

  end
end
