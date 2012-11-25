class BikesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  def index
  	@bikes = Bike.all
  end

  def add
  	name = params[:bike_name]
  	description = params[:bike_description]
  	price = params[:bike_price]
  	bike = Bike.add_bike(name, description, price)
  	if !bike.valid? 
  		 flash[:error] = bike.errors.full_messages.join("<br>").html_safe
  	end
  	redirect_to "/bikes/index"
  end
end
