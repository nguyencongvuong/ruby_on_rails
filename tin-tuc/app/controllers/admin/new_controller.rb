class Admin::NewController < ApplicationController
	layout "backend/_master"
	  		def index

			end

			def create
				
			end

			def edit
				@news=new
			end
			def news
				@news=New.all
			end
			def add
				@news=New.new
			end
end
