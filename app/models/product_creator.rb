class ProductCreator
  attr_reader :errors

  def initialize(url, product_parser: WalmartProductUrlParser, review_parser: WalmartReviewUrlParser)
    @product_parser = product_parser.new(url)
    @review_parser = review_parser
    @errors = []
  end

  def save
    if @product_parser.valid? && product = product_create
      create_reviews_for(product)
      true
    else
      @errors << 'Problems parsing the provided url. Product not added.'
      false
    end
  end

  private

  def product_create
    Product.create(@product_parser.product_params)
  end

  def create_reviews_for(product)
    @product_parser.review_urls.each do |url|
      reviews_params = @review_parser.new(url).reviews_params
      product.reviews.create(reviews_params)
    end
  end
end
