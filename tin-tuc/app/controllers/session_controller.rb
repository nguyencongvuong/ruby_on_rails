class SessionController < ApplicationController
	layout "fontend/_user"
	
		def login
			unless session[:user]
			@user=User.new 
			else
			render "404"
			end
		end
	
	def create
		@user=User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			login_session @user
			redirect_to user_path(@user)
		else
			flash[:error]="Invalid email/password combination"
			render 'login'
		end
	end
end
