class ReviewsController < ApplicationController

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

  def destroy
    puts params
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
