require 'spec_helper'

describe RecipesController do
  render_views

  describe "GET 'show'" do

    it "should return single recipe"

    describe "tags" do
      it "should contains multiple tags"
    end

  end

  describe "GET 'index'" do

    it "should return recipes"

  end

  describe "GET 'new'" do

    it "should be able to edit new recipe"

    it "should have multiple ingredients and count"

    it "should be able to upload image"

    describe "tags" do
      it "should able to  multiple tags"
    end

  end

  describe "GET 'edit'" do

    it "should be able to create new recipe"

    it "should be contain title,desc,instructions and ingredients"

    it "should be able to edit recipe"

  end

  describe "POST 'update'" do
    it "should be able to update recipe"
  end

  describe "POST 'destory'" do
    it "should be able to destory"
  end
end
