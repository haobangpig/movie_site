class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review)
      .permit(:nickname, :rate, :review)
      .merge(product_id: params[:product_id])
  end
end
