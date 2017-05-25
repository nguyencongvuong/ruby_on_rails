class Admin::NewController < ApplicationController
	layout "backend/_master"
	include ApplicationHelper
	def index
		render "admin/index"		
	end
	def create
		@news=New.new(new_params)
		# @news.
		# title=params[:news][:title]
		# @news.description=params[:news][:description]
		# @news.content=params[:news][:content]
		# @news.category_id=params[:news][:category_id]
		if @news.save
			redirect_to :action=>"news"
		else
			render "admin/new/add"
		end
	end
	def edit
		@news=New.find(params[:id])
		
	end
	def update
		@news=New.find(params[:id])
		# @news.title=params[:news][:title]
		# @news.description=params[:news][:description]
		# @news.content=params[:news][:content]
		# @news.category_id=params[:news][:category_id]
		if @news.update(new_params)
			redirect_to :action=>"news"
		else
			render "admin/new/edit"
		end
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
			redirect_to :action=>"news"
		end
	end

	def category
		
	end

	private
	def new_params
		params.require(:news).permit(:title, :description, :category_id, :content)
	end
end
