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
		@category=Category.new(param)	
		# render html: convert("string")	
		if @category.save
			respond_to do |format|
			format.html {redirect_to admin_category_path(), notice: "Bạn vừa tạo thành công một chuyên mục: #{@category.name}" }
			end
		end
	end
	def delete
		@category=Category.find(params[:id])
		@title=@category.name
		respond_to do |format| 
			if @category.destroy
				format.html {redirect_to admin_category_path(),notice:"Bạn vừa xóa thành công chuyên mục: #{@title}"}
			end
		end
	end
	def edit
		@category=Category.find(params[:id])
	end
	def update
		# render html:params[:category].inspect
		@category=Category.find(params[:id])
		@category.update(param)
		if @category.update(param)
			respond_to do |format|
			format.html {redirect_to admin_category_path(),notice: "Bạn vừa update thành công chuyên mục: #{@category.name}"}
			end
		end
	end
	private
	def param
		params.require(:category).permit(:name,:slug,:description,:parent)
	end
end
