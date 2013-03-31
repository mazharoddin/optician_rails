module ApplicationHelper
    def title
        if @title == nil || @title.empty? then
	        title = "Optician Plus"
	    else
            title = "#{@title} | Optician Plus"
        end
    end
	
	def location_hours(is_open, open_at, close_at)
		if is_open == true && (open_at != nil || close_at != nil)
			open_at.strftime('%H:%M') + " - " + close_at.strftime('%H:%M')
		else
			"Closed"
		end
	end
end
