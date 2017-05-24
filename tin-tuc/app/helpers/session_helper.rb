module SessionHelper
	def sign_in(user)
	session[:remember_token]=@user.id
	session[:user]=@user
	end
	def login_session(user)
	session[:user]=@user
	end
end
