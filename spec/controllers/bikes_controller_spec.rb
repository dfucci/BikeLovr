require 'spec_helper'
describe BikesController do
  user = FactoryGirl.build(:user)
  describe "The list of bikes" do
    it "should be accessible to all users" do
      get :index
      response.status.should be 200
    end
  end
  describe "The form to add a new bike" do
    it "should not be accessible for unauthenticated users" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      response.status.should be 302
    end
    it "should be accessible for authenticaded` users" do
      #visit new_user_session_path
      #fill_in "user_name", :with => "Cassano"
      #fill_in "user_password", :with => "adidas"
      #click_button "Sign in"
      #get :new
      #response.status.should be 200
      user = FactoryGirl.create(:user)
      request.env['warden'].stub :authenticate! => user
      #allow(controller).to receive(:current_user) { user }
      #sign_in user
      get :new
      response.status.should be 200
    end
  end

end
