require 'spec_helper'

describe RelationshipsController do
  render_views

  before do
    @user = Factory(:user)
    @followed = Factory(:user)
  end

  context "authorize" do 
    before do
      sign_in @user
    end

    describe "POST create" do

      it "should create a relationship with followed user" do
        User.should_receive(:find).with("123").and_return(@followed)
        #@user.should_receive(:follow!).with(@followed)
        lambda do
          xhr :post, :create , :relationship => {:followed_id => 123}
        end.should change(Relationship,:count).by(1)
      end
    end

    describe "DELETE destroy" do
      it "should delete a relationship with unfollow" do
        relationship = @user.relationships.create(:followed_id => @followed.id) 
        lambda do
          xhr :delete, :destroy , :id => relationship.id
        end.should change(Relationship,:count).by(-1)
        response.should be_success
      end
    end
  end
end
