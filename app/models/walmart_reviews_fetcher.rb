class WalmartReviewsFetcher
  def initialize(product_id, urls)
    @product_id, @urls = product_id, urls
  end

  def fetch
    @urls.each do |url|
      reviews_params = WalmartReviewUrlParser.new(url).reviews_params
      reviews_params.each do |review_params|
        Review.find_or_create_by(review_params) do |review|
          review.product_id = @product_id
        end
      end
    end
  end
end
