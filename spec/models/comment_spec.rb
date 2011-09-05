require 'spec_helper'

describe Comment do
  before do 
    @user = Factory(:user)
    @recipe = Factory(:recipe , :author => @user)
  end

  it "should have a recipe" do 
    comment = @recipe.comments.build(:commenter => @user)
    comment.recipe.should == @recipe
  end

  it "should have a commenter" do 
    comment = @recipe.comments.build(:commenter => @user)
    comment.commenter.should == @user
  end
end
