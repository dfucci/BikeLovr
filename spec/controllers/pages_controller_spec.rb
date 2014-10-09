require 'spec_helper'
describe PagesController, :type => :controller do
  describe "GET About" do
    it "has a 200 status code" do
      get :about
      response.status.should be 200
    end
  end
  describe "GET Contact" do
    it "has a 200 status code" do
      get :contact
      response.status.should be 200
    end
  end
end
