class FontendController < ApplicationController
	layout "fontend/_master"
	def index
		@news=New.all
		@category=Category.where(parent:0)
		
	end

	def detail
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
		
	end
	def search
		@key=params[:s]
		@equal=New.where("title LIKE ?","%#{@key}%")
	end
	private 
	def param
		params.require(:comment).permit!
	end
end
