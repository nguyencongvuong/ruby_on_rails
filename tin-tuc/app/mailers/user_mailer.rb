class UserMailer < ApplicationMailer
	default from: "nguyenvuonghn92@gmail.com"
	def active(user)
		# session[:user_id]=@user.password_digest
		@user = user
    	@url  = 'http://localhost:3000/user/active/'+@user.password_digest
    	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end
end
