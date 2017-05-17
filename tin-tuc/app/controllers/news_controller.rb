class NewsController < ApplicationController
	layout "backend/_master"
		
	  		def index

			end
			def edit
				@news=new
			end
			def news
				@news=New.all
			end
end
