class UserController < ApplicationController
layout "fontend/_user"
	def index
	end
	def register 
		# @users=User.new
		render  "user/form"
	end
	def create 
		@user=User.create(param)
		if @user
			respond_to do |format|
				format.html {redirect_to user_show_path(),notice: "Xin chào, #{@user.name}" }
			end
		end
	end
	def show
	end
	private
	def param
		params.require(:user).permit(:email,:name,:password,:role)
	end
end
