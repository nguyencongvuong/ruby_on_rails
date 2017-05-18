class Admin::NewController < ApplicationController
	layout "backend/_master"
	  		def index

			end

			def create
				@news=New.new
				@news.title=params[:news][:title]
				
				@news.description=params[:news][:description]
				@news.content=params[:news][:content]
				@news.category_id=params[:news][:category_id]
				if @news.save
				else
					render "admin/new/add"
				end

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
