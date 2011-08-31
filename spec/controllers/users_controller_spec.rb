require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

    before :each do
      @user = Factory(:user)
      sign_in @user
    end

    it "should be successful" do
      get :show ,:id => @user
      response.should be_success
    end

    it "should be include user name" do
      get :show , :id => @user
      response.should have_selector("h1",:content => @user.name)
    end
  end

  describe "GET 'index'" do

    before :each do
      @user = Factory(:user)
      second = Factory(:user, :email => "test@foo.bar",:name => "Michael Jackson")
      third = Factory(:user, :email => "test2@foo.bar",:name => "Lebron James")
      sign_in @user
      @users = [@user, second, third ]
      50.times do
        @users << Factory(:user, :email => Factory.next(:email))
      end
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have user data for each user" do
      get :index

      @users[0..2].each do |user|
        response.should have_selector("div", :content=> user.name)
      end
    end
  end

end
