class UserController < ApplicationController
layout "fontend/_user"
	def index
	end
	def register 
		@user=User.new()
		render  "user/form"
	end
	def create 
		@user=User.new(param)
		# if @user.password == @user.password_confirmation
			if @user.save
				UserMailer.active(@user).deliver_now
				respond_to do |format|
					format.html {redirect_to user_show_path(),notice: "Hãy vào email để xác nhận tài khoản" }	
				end
			else
				render "user/form"
			end
		# else
		# 	redirect_to user_register_path, @user.errors: "Password confirmation mismatch"
		# end
	end
	def show
	end
	def active
		@user=User.find_by(password_digest: "#{params[:slug]}")
			unless @user.nil?
			@user.update(active:"active")
				render html: "Bạn đã active thành công"
			else
			render "user/show"
			end
	end
	
	private
	def param
		params.require(:user).permit(:name,:email,:password_digest,:password,:password_confirmation)
	end
end
