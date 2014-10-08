class BikesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :check_ownership, :except => [:show, :index, :new, :create]
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

  protected
  def check_ownership
    owner = Bike.find(params[:id]).user_id if params[:id]
    redirect_to root_path unless current_user.id == owner
  end
end

