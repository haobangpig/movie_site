class Product < ApplicationRecord
  has_many :reviews

  def reviews_average
    reviews.average(:rate).round
  end
end
