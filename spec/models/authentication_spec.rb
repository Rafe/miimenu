require 'spec_helper'

describe Authentication do
  before do 
    @user = Factory(:user)
    @attr = {
      :provider => :facebook,
      :uid => 123456,
      :credentials => "alkdjlakckjlajdwajldalckajlskj"
    }
  end

  it "should belongs to a user" do 
    auth = Authentication.new(:user => @user)
    auth.user.should == @user
  end

  it "should have provider and uid" do 
    auth = @user.authentications.build(@attr.merge({ :uid => nil,:provider => nil}))
    auth.should_not be_valid
  end

  it "should validate attributes presense" do
    authentication = Authentication.new
    authentication.save.should be_false
  end
end
