require 'spec_helper'

describe Users::OmniauthCallbacksController do

  #setting devise, read http://github,cin.intridea/omniauth/wiki/Integration-Testing
  before do 
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "onmiauth provider" do 
    it "should support omniauth provider twitter and facebook" do
      User.omniauth_providers.should include(:facebook,:twitter)
    end
  end

  describe "facebook" do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
      @user = Factory(:user)
    end

    it "should support facebook action and redirect to new user registrations" do
      User.stub!(:find_for_facebook_oauth).and_return(@user)
      get :facebook
      response.should redirect_to(root_path)
    end
  end

  describe "twitter" do
    before do
      @user = Factory(:user)
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    end

    it "should support twitter action and redirect to new user registrations" do
      User.stub!(:find_for_twitter_oauth).and_return(@user)
      get :twitter
      response.should redirect_to(root_path)
    end
  end
end
