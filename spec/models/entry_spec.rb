require 'spec_helper'

describe Entry do
  before do
    @user = Factory(:user)
    @recipe = Factory(:recipe,:author => @user)
    @menu = @user.menus.create()
  end

  it "belongs to a menu" do
    entry = @menu.entries.create(:recipe => @recipe)
    entry.menu.should == @menu
       
  end

  it "belongs to a recipe" do
    entry = @menu.entries.create(:recipe => @recipe)
    entry.recipe.should == @recipe
  end
end
# == Schema Information
#
# Table name: entries
#
#  id         :integer(4)      not null, primary key
#  owner_id   :integer(4)
#  recipe_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

