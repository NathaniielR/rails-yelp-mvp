class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
    render 'reviews/new' # Explicitly rendering the new template
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
      render 'reviews/new' # Explicitly rendering the new template when there are errors
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
