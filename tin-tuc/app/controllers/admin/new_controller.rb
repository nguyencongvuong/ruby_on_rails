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
					redirect_to :action=>"news"
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
			def delete
				@news=New.find(params[:id])
				@news.destroy
				if @news.destroy
					redirect_to :action=>"news", :alert=>"Bạn vừa xóa thành công một bài viết"
				end
			end
end
