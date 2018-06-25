require 'shopify_api'

SHOPIFY_SHOP='ksingh-shop.myshopify.com'
SHOPIFY_API_KEY='6eeeb650e965df03c4585619adec8224'
SHOPIFY_PASSWORD='fc7380467709a0696421a8a5a26df5e6'

# Configure the Shopify API with our authentication credentials.
ShopifyAPI::Base.site = "https://#{SHOPIFY_API_KEY}:#{SHOPIFY_PASSWORD}@#{SHOPIFY_SHOP}/admin"

orders = ShopifyAPI::Order.find(:all, params: { created_at_min: (Time.now - 30.days), limit: 250, status: "any" })

# puts orders.to_json

=begin

customers = ShopifyAPI::Product.all

puts customers
puts customers.to_json

orders = ShopifyAPI::Order.all

puts orders.to_json
=end

product_sales = orders.map { |o| o.line_items }.flatten.inject({}) do |product_sales, line_item|
  product_sales.merge(
    Hash[line_item.product_id, line_item.quantity]
  ) { |_, current, additional| current + additional }
end

product_sales = Hash[product_sales.sort_by{ |k, v| v }.reverse]

most_popular_products = product_sales.keys.take(10)

products = ShopifyAPI::Product.find(:all, params: { limit: 250 })

products.each do |product|
  # Convert tags, which are stored as a comma-separated string, into an array.
  tags = product.tags.split(',').map(&:strip)

   # Add or remove the "Best Seller" tag from the list of product tags depending
  # on whether the product is in the most popular list.
  if most_popular_products.include?(product.id)
    tags << "Best Seller"
  else
    tags.delete("Best Seller")
  end

 updated_tags = tags.uniq.join(',')

    product.tags = updated_tags
    product.save
  
end

products.each { |p| puts p.tags }
