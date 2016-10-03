class ProductCreator
  attr_reader :errors

  def initialize(url, product_parser: WalmartProductUrlParser)
    @product_parser = product_parser.new(url)
    @errors = []
  end

  def save
    if @product_parser.valid? && product = product_create
      create_reviews_for(product.id)
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

  def create_reviews_for(product_id)
    ReviewsFetchJob.perform_later(product_id, @product_parser.review_urls)
  end
end
