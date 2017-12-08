class ReviewsController < ApplicationController
  before_filter :require_login

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user

    if @review.save!
      redirect_to @product, notice: 'Review was successfully created'
    else
      render @product, notice: 'Review was not successfully created'
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
