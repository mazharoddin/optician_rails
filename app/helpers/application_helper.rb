module ApplicationHelper
    def title
        if @title == nil || @title.empty? then
	        title = "Optical Hero"
	    else
            title = "#{@title} | Optical Hero"
        end
    end
end
