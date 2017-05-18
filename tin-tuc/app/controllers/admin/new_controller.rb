class Admin::NewController < ApplicationController
	layout "backend/_master"
	  		def index

			end

			def create
				@news=New.new
				@news.title=params[:news][:title]
				@news.description=params[:news][:description]
				@news.author_id=params[:news][:author_id]
				@news.content=params[:news][:conetent]
				
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
