require 'spec_helper'

describe User do
  before :each do
    @attr = {
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end

  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should accept valid email address" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address ))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address ))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "menu_names" do
    it "should return menu names that user have" do
      user = Factory(:user)
      menu = user.menus.create()
      user.menu_names.should == [menu.name]
    end
  end

  describe "passwords" do

    before :each do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end

    describe "validation" do
      it "should require a password" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.should_not be_valid
      end

      it "should require a matching password confirmation" do
        @user.password_confirmation = "invalid"
        @user.should_not be_valid
      end

      it "should reject short passwords" do
        short = "a" * 5
        hash = @attr.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end
    end

    describe "encryption" do
      it "should have an encrypted password attribute" do
        @user.should respond_to(:encrypted_password)
      end

      it "should set the encrypted password attribute" do
        @user.encrypted_password.should_not be_blank
      end
    end
  end

  describe "user activities" do
    before do
      @user = Factory(:user)
      @recipe = Factory(:recipe, :author_id => @user.id)
    end

    describe "like!" do 

      it "should record in activities" do
        lambda do
          @user.like!(@recipe)
        end.should change(Activity,:count).by(1)
      end

      it "should increase recipe's likes" do
        lambda do
          @user.like!(@recipe)
        end.should change(@recipe,:likes).by(1)
      end
    end

    describe "cook!" do

      it "should create an default menu if user have no menu" do
        lambda do
          @user.cook!(@recipe)
        end.should change(@user.menus,:count).by(1)
        @user.menus.find_by_name("To make").name.should_not be_nil
      end

      it "should add recipe to menu 'To make'" do
        lambda do
          @user.cook!(@recipe)
        end.should change(Entry,:count).by(1)
        @user.to_make.recipes.should include(@recipe)
      end

      it "should not add same recipe to menu 'To make twice'" do
        lambda do
          @user.cook!(@recipe)
          @user.cook!(@recipe)
        end.should change(Entry,:count).by(1)
      end
    end
  end

  describe "follow relationship" do
    before :each do
      @user = User.create(@attr)
    end

    it "should be able to get all following" do
      @user.should respond_to(:following)
    end

    it "should have respond to follow!" do
      @user.should respond_to(:follow!)
    end

    describe "follow!" do
      before :each do
        @user2 = User.create(:name =>"tester",
                             :email=>"some@company.com",
                             :password=>"abcdef")
      end

      it "should be able to create relationship with followed user" do
        @user.follow! @user2
        @user.following.should include(@user2)
      end
    end
  end

  it "menu_name should return menus name" do
    
  end

end
# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  name                 :string(255)
#

