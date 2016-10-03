class WalmartProductUrlParser
  REQUIRED_PARAMS = %w(walmart_id name price)

  def initialize (url)
    @url = url[:url]
    @product_id = @url[/([^\/]\d+)$/]
    @document = get_document
  end

  def valid?
    REQUIRED_PARAMS.any? { |param| !self.send("product_#{param}").nil? }
  end

  def product_params
    {
      product_id: @product_id,
      walmart_id: product_walmart_id,
      name: product_name,
      price: product_price,
      url: @url
    }
  end

  # This should clearly be extracted from here to a separate class and properly tested
  # but I just don't have time to properly handle this.
  def review_urls
    urls = []
    reviews_base_url = "https://www.walmart.com/reviews/product/#{@product_id}"
    reviews_doc = Nokogiri::HTML(open(reviews_base_url))
    last_page_number = reviews_doc.at_css('.paginator-list').search('li a').last.text
    (1..last_page_number.to_i).each do |i|
      urls << { url: "#{reviews_base_url}?limit=20&page=#{i}&sort=relevancy" }
    end
    urls
  end

  private

  def get_document
    Nokogiri::HTML(open(@url))
  end

  def product_name
    @name ||= parsed_node(@document.at_css('.product-name'))
  end

  def product_walmart_id
    @walmart_id ||= get_product_walmart_id
  end


  def get_product_walmart_id
    walmart_id_node = @document.at_css('.product-subhead-walmartnumber')
    if walmart_id_node
      walmart_id_node.text.gsub(/[^\d,\.]/, '')
    else
      nil
    end
  end

  def product_price
    @price ||= get_product_price
  end

  def get_product_price
    price_node = @document.at_css('.price-display')
    if price_node
      BigDecimal(price_node.text.gsub(/[^\d,\.]/, ''))
    else
      nil
    end
  end

  def parsed_node(node)
    node ? node.text.strip : nil
  end
end
