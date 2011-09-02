require 'spec_helper'

describe Activity do
  before do
    @user = Factory(:user)
    @recipe = Factory(:recipe, :author => @user)
    @followed = Factory(:user, :email => "somewhere@good.edu")
    @attr = {
      :user_id => @user.id,
      :action => :like,
      :target => @recipe
    }
  end

  it "should have a action name" do
    activity = Activity.new(@attr)
    activity.action.should == :like
  end

  it "should have a target" do
    
  end
end
