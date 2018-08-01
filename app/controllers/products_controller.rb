class ProductsController < RankingController
  before_action :authenticate_user!, only: :search
  def index
    @products = Product.all.limit(20).order('id DESC')
  end

  def show
    @product = Product.find(params[:id])
    @review = @product.reviews
  end

  def search
    @products = Product.where('title LIKE(?)', "%#{search_params[:keyword]}%").limit(10)
  end

  def new
    @products = Product.new
  end

  private

  def search_params
    params.permit(:keyword)
  end
end
