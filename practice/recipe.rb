=begin
reference pages:

1. https://github.com/jhu-ep-coursera/fullstack-course1-module3/blob/master/Assignments/Lesson03-Assignment01-HTTP-Client/README.pdf
2. https://github.com/zfz/rails-specialization/tree/master/graded-assignments/course01/module03/assignment01-Recipe-Hunter

=end

require 'httparty'

class Recipe

	include HTTParty
	@@api_key = ENV['FOOD2FORK_KEY']
	
	base_uri "https://food2fork.com/api"
	
	def self.fetch_recipes(query)
		get("/search",  { query: { key: @@api_key, q: query } })
	end

end

pp Recipe.fetch_recipes("paneer makhni")