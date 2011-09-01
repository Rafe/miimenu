require 'spec_helper'

describe Menu do

  before :each do
    @user = Factory(:user)
    @recipe = Factory(:recipe, :author_id => @user.id)
    @menu = Menu.create(:owner_id => @user.id,:name => "To make")
  end

  it "should have a owner" do
    @menu.owner.should == @user
  end

  it "should have a name" do
    @menu.name.should == "To make"
  end

  it "should have recipes" do
    @menu.entries.create(:recipe => @recipe)
    @menu.recipes.should == [@recipe]
  end

end
# == Schema Information
#
# Table name: menus
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)     default("To make")
#

