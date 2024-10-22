class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    render :index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new # This is for the new review form on the show page
    render :show
  end

  def new
    @restaurant = Restaurant.new
    render :new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
