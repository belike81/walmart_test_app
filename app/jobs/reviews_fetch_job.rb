class ReviewsFetchJob < ApplicationJob
  queue_as :default

  # This should be in a separate class
  def perform(product_id, urls)
    WalmartReviewsFetcher.new(product_id, urls).fetch
  end
end
