require 'spec_helper'

describe Recipe do
  before do
    @user = Factory(:user)
    @recipe = Factory(:recipe, :author => @user)
  end

  it "should have ingredients" do
    recipe = @user.recipes.build(:name => "test",
                                :description => "some",
                                :instructions => "things")
    recipe.should_not be_valid
    recipe.ingredients = [Ingredient.new(:name=>"test",:quantity => "12g")]
    recipe.should be_valid

  end

  describe "menu" do
    before do
      @menu = @user.menus.create(:name => "To make")
      @menu.entries.create(:recipe_id => @recipe.id)
      
    end
    it "should show the menus have recipe" do
      @recipe.menus.should == [@menu]
    end
  end


  describe "followed_by" do

    it "respond to followed" do
      Recipe.should respond_to(:followed_by)
    end

    it "should return user followed" do
      Recipe.followed_by(@user).should include(@recipe)
    end
  end

  describe "search" do

    it "respond to search" do
      Recipe.should respond_to(:search)
    end

    it "should able to search" do
      Recipe.search_for("food").should include(@recipe)
    end
  end


  describe "validation" do
    before :each do
      @attr = {
        :name => "test",
        :description => "test",
        :instructions => "test",
        :ingredients => [Ingredient.new(:name=>"test",:quantity => "12g")]
      }
    end

    it "should require author_id" do
      Recipe.new(@attr).should_not be_valid
    end

    it "should validate correctly" do
      @user.recipes.build(@attr).should be_valid
    end
  end

end
# == Schema Information
#
# Table name: recipes
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  description        :text
#  instructions       :text
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  author_id          :integer(4)
#  tags               :string(255)
#

