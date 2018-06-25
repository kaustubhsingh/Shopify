#!/usr/bin/env ruby
require 'pry'
require 'shopify_api'
require 'dotenv'
Dotenv.load

class TagCustomers
end
 
# Called when the file is run on the command line, but not in a require
if __FILE__ == $PROGRAM_NAME
  TagCustomers.new
end