module ApplicationHelper

	
	def need_stylesheet(file_name)
		@css_flag = []
		if not @css_flag.include? file_name 
			@css_flag << file_name
			stylesheet_link_tag file_name
		end
		
	end
	
end
