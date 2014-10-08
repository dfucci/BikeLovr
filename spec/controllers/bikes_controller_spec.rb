require 'spec_helper'
describe BikesController do
  user = FactoryGirl.build(:user)
  describe "The list of bikes" do
    it "should be accessible to all users" do
      get :index
      response.status.should be 200
    end
  end
  describe "Adding a new bike" do
    it "should not be accessible for unauthenticated users" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      response.status.should be 302
    end
    it "should be accessible for authenticaded` users" do
      user = FactoryGirl.create(:user)
      request.env['warden'].stub :authenticate! => user
      get :new
      response.status.should be 200
    end
  end
   describe "Editing a bike" do
     it "should not be accessibe to an unauthenticated user" do
       bike = FactoryGirl.create(:bike)
       get :edit,{:id => bike.id}
       response.status.should be 302
     end
      it "should be possible for the owner of the bike" do
        user = FactoryGirl.build(:user)
        request.env['warden'].stub :authenticate! => user
        bike = FactoryGirl.create(:bike)
        get :edit, id: bike.id
        response.status.should be 200
      end
   end

end
