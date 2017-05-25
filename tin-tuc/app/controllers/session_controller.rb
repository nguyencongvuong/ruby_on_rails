class SessionController < ApplicationController
	layout "fontend/_user"	
	def login
		unless session[:user] && session[:user].nil?
		@user=User.new 
		else
		render "404"
		end
	end
	def create
		@user=User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			login_session @user
			redirect_to session[:back]
		else
			flash[:error]="Invalid email/password combination"
			render 'login'
		end
	end

	def logout
		session[:user].clear
		redirect_to session[:back]
	end
end
