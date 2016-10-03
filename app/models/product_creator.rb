class ProductCreator
  attr_reader :errors

  def initialize(url, parser: WalmartUrlParser)
    @parser = parser.new(url)
    @errors = []
  end

  def save
    if @parser.valid? && product_create
      true
    else
      @errors << 'Problems parsing the provided url. Product not added.'
      false
    end
  end

  private

  def product_create
    Product.create(@parser.product_params)
  end
end
