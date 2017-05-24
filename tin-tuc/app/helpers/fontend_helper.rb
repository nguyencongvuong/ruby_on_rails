module FontendHelper
	def comments
		@user=session[:user]["id"]
		@arr=[]
		@id=getslug(params[:slug])
		@comments=Comment.where(new_id:1).order("created_at desc")
		@comments.each do |comment|
			 @arr.push([:content=>comment.content,:time=>comment.created_at,:user_name=>User.find(comment.user_id)])
		end
			return @arr
	end
	def getslug(slug)
		@id=slug.split("-").to_a
		@id=@id.last
		# new=New.find(@id)
		return @id
	end
end
