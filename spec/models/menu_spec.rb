require 'spec_helper'

describe Menu do

  before :each do
    @user = Factory(:user)
    @recipe = Factory(:recipe, :author_id => @user.id)
    @menu = Menu.new(:user_id => @user.id,:recipe_id => @recipe.id)
  end
    
  it "should have default category" do
    @menu.category.should == "To make"
  end

  it "should not able to set category other than default categorys" do
    @menu.category = "Some category"
    @menu.should_not be_valid
  end
end
# == Schema Information
#
# Table name: menus
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  recipe_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

