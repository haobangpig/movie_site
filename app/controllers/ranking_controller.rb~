class RankingController < ApplicationController
  layout 'review_site'
  before_action :ranking

  def index
    @products = Product.all
  end

  def ranking
    ranking =  Review.group(:product_id).order('count_product_id DESC').count(:product_id).keys
    @ranking = ranking.map { |t| Product.find(t) }
  end
end
