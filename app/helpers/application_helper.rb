module ApplicationHelper
    def title
        if @title == nil || @title.empty? then
	        title = "Opticare Pro"
	    else
            title = "#{@title} | Opticare Pro"
        end
    end
end
