require 'spec_helper'

describe Relationship do
  before :each do
    @user = Factory(:user)
  end

  it "should require recipe id and user id" do
    relationship = Relationship.new
    relationship.should_not be_valid
  end
end
# == Schema Information
#
# Table name: relationships
#
#  id          :integer(4)      not null, primary key
#  follower_id :integer(4)
#  followed_id :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

