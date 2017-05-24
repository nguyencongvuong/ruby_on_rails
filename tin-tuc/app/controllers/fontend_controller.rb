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
			render html:"save"
		end
	end
	private 
	def param
		params.require(:comment).permit!
	end
end
