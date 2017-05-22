class Admin::CategoryController < ApplicationController
	layout "backend/_master"
	include ApplicationHelper
	# include CategoryHelper
	def index
	end
	def create
		@category=Category.new
	end
	def save
		@news=New.new
		@category=Category.new
		@category.slug=params[:category][:slug]
		@category.name=params[:category][:name]
		@category.description=params[:category][:descreption]
		@category.parent=params[:category][:parent]
		@category.save
		# render html: convert("string")
		if @category.save
			redirect_to admin_category_path()
		end
	end
	def delete
		@category=Category.find(params[:id])
		if @category.destroy
			redirect_to admin_category_path()
		end
	end
	def edit
		@category=Category.find(params[:id])
	end
	def update
		# render html:params[:category].inspect
		@category=Category.find(params[:id])
		@category.name=params[:category][:name]
		@category.slug=params[:category][:slug]
		@category.description=params[:category][:description]
		@category.parent=params[:category][:parent]
		@category.save
		if @category.save
			redirect_to admin_category_path()
		end
	end
end
