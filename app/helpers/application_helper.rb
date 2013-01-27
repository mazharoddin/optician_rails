module ApplicationHelper
    def title
        if @title == nil || @title.empty? then
	        title = "Optician Plus"
	    else
            title = "#{@title} | Optician Plus"
        end
    end
end
