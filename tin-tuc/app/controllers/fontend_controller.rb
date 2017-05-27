class FontendController < ApplicationController
	layout "fontend/_master"
	include FontendHelper
	before_action :set_category
	before_action :set_news
	def index	
	end
	def loadnew
		if params[:id]
		@news=New.where('id < ?',params[:id]).limit(5)
		else
			@news=New.limit(5)
		end
		@category_parent=Category.where(parent:0)
		@id=params[:id]
		respond_to do |format|
			format.html
			format.js
		end	
	end
	def detail
		@noibat=noibat(getslug(params[:slug]))
		@comments=comments
		@new=New.where(slug: params[:slug])
	end
	def comment
		@comment=Comment.new(param)
		if @comment.save
			respond_to do |format|
			format.html {redirect_to "#{session[:back]}"}
			end
		end
	end
	def category
		@category_parent=Category.where(parent:0)
		id=getCatId(params[:category])
		@new_in_category=New.where(category_id:id).paginate(:page=>params[:page],:per_page=>10)
	end
	def search
		@key=params[:s]
		@equal=New.where("title LIKE ?","%#{@key}%")
	end
	private 
	def param
		params.require(:comment).permit!
	end
	def set_category
		@category_parent=Category.where(parent:0)
	end
	def set_news
		@news=New.limit(5)
	end
end
