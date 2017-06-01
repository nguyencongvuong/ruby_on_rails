class Admin::UserController < ApplicationController
	before_action :users,only: [:index]
	layout "backend/_master"
	skip_before_action :verify_authenticity_token,only:[:update]
	def index

	end
	def update
		@role=params[:role]
		@id=params[:id]
		@user=User.find(@id)
		@user.role=@role
		if @user.save
			@users=User.all.paginate(:page=>params[:page]).per_page(5)
			respond_to do |format|
				format.js
			end
		end
	end 
	private
	def users 
		@users=User.all.paginate(:page=>params[:page]).per_page(5)
	end

end
