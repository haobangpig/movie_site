class ReviewsController < RankingController
  before_action :authenticate_user!, only: :new
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
    params.require(:review).permit(:rate, :review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
