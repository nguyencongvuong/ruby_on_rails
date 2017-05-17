class Admin::CategoryController < ApplicationController
	layout "backend/_master"
	def index

	end
	def create
		@category=Category.new
	end
	def save
		@category=Category.new
		@category.name=params[:category][:name]
		@category.description=params[:category][:descreption]
		@category.parent=params[:category][:parent]
		@category.save

	end 
end
