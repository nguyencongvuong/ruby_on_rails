class AdminController < ApplicationController
		
		layout "backend/_master"
		
	  		def index

			end
			def edit
			end
			def news
				@news=New.all
			end
		
  #...
	
end
