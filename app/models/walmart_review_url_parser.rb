class WalmartReviewUrlParser
  def initialize(url)
    @url = url[:url]
    @review_nodes = get_review_nodes
    @review_params = []
  end

  def reviews_params
    @review_params.empty? ? parse_review_nodes : @review_params
  end

  private

  def get_review_nodes
    Nokogiri::HTML(open(@url)).css('.customer-review')
  end

  def parse_review_nodes
    @review_nodes.each do |review_node|
      @review_params << { review_id: review_id(review_node), title: review_title(review_node), description: review_description(review_node), username: review_username(review_node), review_date: review_date(review_node) }
    end
    @review_params
  end

  def review_id(node)
    node['data-content-id']
  end

  def review_title(node)
    parsed_node(node.at_css('.customer-review-title'))
  end

  def review_description(node)
    parsed_node(node.at_css('.customer-review-text'))
  end

  def review_username(node)
    parsed_node(node.at_css('.customer-name-heavy'))
  end

  def review_date(node)
    Date.strptime(parsed_node(node.at_css('.customer-review-date')), "%m/%d/%Y")
  end

  def parsed_node(node)
    node ? node.text.strip : nil
  end
end
