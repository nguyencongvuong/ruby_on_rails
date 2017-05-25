module FontendHelper
		def comments
			# if session[:user]["id"] && !session[:user]["id"].nil?
			# @user=session[:user]["id"]
			# end
			@arr=Array.new
			@id=getslug(params[:slug])
			@comments=Comment.where(new_id:@id).order("created_at desc")
			@comments.each do |comment|
				@arr.push([:content=>comment.content,:time=>comment.created_at,:user_name=>User.find(comment.user_id)])
			end
			return @arr
		end

		def getslug(slug)
			@id=New.find_by slug: slug
			@id=@id.id
			# new=New.find(@id)
			return @id
		end

		def back(url)
		session[:back]=@url
		end
		def categorySlug(id)
			@slug=Category.find(id).slug
			return @slug
		end
		#đổi category id->slug
		def getCatId(slug)
			@cat=Category.find_by slug: slug
			@parent=@cat.parent
				if @parent==0
					@id=Array.new.push(Category.find_by parent: 2)
				else
					@id=@cat.id
				end
			return @id
		end
		
		def newInCat(id)
			if id.is_a? Numeric
				@news=New.where(category_id: id)
			end
			return @news
		end
		#đổi 
	
	
end
