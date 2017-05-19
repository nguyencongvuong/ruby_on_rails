class New < ApplicationRecord
	validates :title,presence:true
	validates :content,presence:true
	belongs_to :category 

	before_save :convert
	private
	def convert
		self.slug=convert_string(title)
	end
		def convert_string(string)
				# space=[" "]
				# a=["á","ằ","à","ả","ạ","ã","ă","ắ","ằ","ặ","ẵ","ấ","ầ","ẩ","ậ","ẫ"]
				# e=["ê","ế","ể","ệ","ễ","é","ẻ","è","ẽ","ẹ","é"]
				# o=["ô","ổ","ồ","ố","ộ","ó","ò","ỏ","õ","ọ","ơ","ỡ","ở","ợ","ờ","ớ"]
				@convert=string.mb_chars.downcase
				@convert=@convert.gsub(/[áằàảạãăắằặẵấầẩậẫâ]/,"a")
				@convert=@convert.gsub(/[êếểệễềéẻèẽẹé]/,"e")
				@convert=@convert.gsub(/[ôổồốộóòỏõọơỡởợờớ]/,"o")
				@convert=@convert.gsub(/[ưửứữựừúủùụũ]/,"u")
				@convert=@convert.gsub(/[íỉìịĩ]/,"i")
				@convert=@convert.gsub(/[ýỷỳỵỹ]/,"y")
				@convert=@convert.gsub(/[đ]/,"d")
				@convert=@convert.gsub(/[{}!“”.…–]/,'')
				@convert=@convert.gsub( /\[/,'')
				@convert=@convert.gsub( /\]/,'')
				@convert=@convert.gsub(/[%@&",'"',"'","  ","   "]/," ")
				@convert=@convert.gsub(/  /," ")
				@convert=@convert.gsub(/["---","--",",","\/","\\","|","_","+",' ']/,"-")
				# @convert=@convert.gsub(/" "/,"-")
				return @convert
	end
end
