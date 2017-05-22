class FontendController < ApplicationController
	layout "fontend/_master"
	def index
		@news=New.all
		@category=Category.where(parent:0)
		
	end
end
