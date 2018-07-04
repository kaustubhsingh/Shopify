ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "422c84c53668242d9180d2799894d8c3"
  config.secret = "029532bc9f8ef4e6746da4eb6c00fa04"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop
end
