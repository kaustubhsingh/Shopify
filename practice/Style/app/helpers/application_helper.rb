module ApplicationHelper

	def need_stylesheet(name_string)
		return "<link href=#{name_string} rel=\"stylesheet\">".html_safe
	end
	
end
