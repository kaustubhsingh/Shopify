#!/usr/bin/env ruby
require 'pry'
require 'shopify_api'
require 'dotenv'
Dotenv.load

class EmailCustomers
    
  attr_accessor :shop_url
 
  # Configure the Shopify connection
  def initialize
    @shop_url = "https://#{ENV["SHOPIFY_API_KEY"]}:#{ENV["SHOPIFY_PASSWORD"]}@#{ENV["SHOP"]}.myshopify.com/admin"
    ShopifyAPI::Base.site = @shop_url
    # puts @shop_url
  end
  
  # Tests the Shopify connection with a simple GET request
  def test_connection
    return ShopifyAPI::Shop.current
  end
  
  def customers
    ShopifyAPI::Customer.all
  end
  
# Tags repeat customers with the tag "repeat"
def get_customers_email
  customer_emails = {}
  
  customers.each do |customer|
    puts "Customer #{customer.email} accepts marketing #{customer.accepts_marketing}\n"
    customer_emails[customer.id] = customer.email
  end

  customer_emails 
end


end
 
# Called when the file is run on the command line, but not in a require
if __FILE__ == $PROGRAM_NAME
    
  emails = EmailCustomers.new.get_customers_email
  puts emails

  
end