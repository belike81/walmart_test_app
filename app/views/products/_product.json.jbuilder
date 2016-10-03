json.extract! product, :id, :walmart_id, :name, :price, :url, :created_at, :updated_at
json.url product_url(product, format: :json)