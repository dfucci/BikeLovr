class BikesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  def index
  	@bikes = Bike.all
  end
  def new
    @bike = Bike.new
  end

  def create
    bike = Bike.new(params[:bike])
  	if !bike.save
  		 flash[:error] = bike.errors.full_messages.join("<br>").html_safe
  	end
  	redirect_to bikes_path
  end

  def show
    @bike = Bike.find params[:id]
  end

  def edit
    @bike = Bike.find params[:id]
  end
end

