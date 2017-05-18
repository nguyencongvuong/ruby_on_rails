class Admin::CategoryController < ApplicationController
	layout "backend/_master"
	helper :application

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
	end 
end
