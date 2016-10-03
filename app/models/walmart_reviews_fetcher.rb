class WalmartReviewsFetcher
  def initialize(product_id, urls)
    @product = Product.find(product_id)
    @urls = urls
  end

  def fetch
    @urls.each do |url|
      reviews_params = WalmartReviewUrlParser.new(url).reviews_params
      @product.reviews.create(reviews_params)
    end
  end
end
