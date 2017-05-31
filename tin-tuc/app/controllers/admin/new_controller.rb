class Admin::NewController < ApplicationController
	layout "backend/_master"
	include ApplicationHelper
	skip_before_action :verify_authenticity_token,only:[:ajax,:search]
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
		@news=New.order("id ASC").paginate(:page => params[:page], :per_page => 5)
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
	def ajax
		@params=params[:news]
		@news=New.all.order("id DESC").paginate(:page => params[:page], :per_page => @params)
		respond_to do |format|
			format.html{redirect_to :news}
			format.js
		end
	end
	def search
		
		if params[:key]
			@params=params[:key].downcase
			@news=New.where("title LIKE ?","%#{@params}%").paginate(:page=>params[:page],:per_page=>5)
		end
		respond_to do |format|
			format.js
		end
	end
	private
	def new_params
		params.require(:news).permit(:title, :description, :category_id, :content,:noi_bat)
	end
end
