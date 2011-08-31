require 'spec_helper'

describe Ingredient do
  before :each do 
    @ingredient = Ingredient.new(:name => "onion",:quantity =>"200g")
  end

  it "should hold ingredient's name and quantity" do
    @ingredient.name.should == "onion"
    @ingredient.quantity.should == "200g"
  end

end
# == Schema Information
#
# Table name: ingredients
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  quantity   :string(255)
#  recipe_id  :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

