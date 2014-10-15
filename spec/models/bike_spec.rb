require 'spec_helper'
describe Bike do
  it "has a valid factory" do
    FactoryGirl.create(:bike).should be_valid
  end
  it "has a valid name" do
    FactoryGirl.build(:bike, name:nil).should_not be_valid
  end
  it "can have a picture" do
    FactoryGirl.build(:bike).should be_valid
    FactoryGirl.build(:bike, picture:nil, user:nil).should be_valid
  end
  context "price" do
    it "is valid" do
      FactoryGirl.build(:bike, price:nil).should_not be_valid
    end
    it "is numeric" do
      FactoryGirl.build(:bike, price:"string").should_not be_valid
    end
    it "is positive" do
      FactoryGirl.build(:bike, price:-20).should_not be_valid
    end
  end
end
