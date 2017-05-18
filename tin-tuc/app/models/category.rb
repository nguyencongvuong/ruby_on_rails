class Category < ApplicationRecord
	has_many :news
	validates :name,presence:true,uniqueness:true 
	validates :slug,uniqueness:true
	# helper :application
	before_save :convert
	private
	def convert
			if 	self.slug.empty? 
				self.slug=convert_string(name.mb_chars.downcase)
			else
				self.slug=convert_string(slug.mb_chars.downcase)
			end
		
	end
		def convert_string(string)
				# space=[" "]
				# a=["á","ằ","à","ả","ạ","ã","ă","ắ","ằ","ặ","ẵ","ấ","ầ","ẩ","ậ","ẫ"]
				# e=["ê","ế","ể","ệ","ễ","é","ẻ","è","ẽ","ẹ","é"]
				# o=["ô","ổ","ồ","ố","ộ","ó","ò","ỏ","õ","ọ","ơ","ỡ","ở","ợ","ờ","ớ"]
				@convert=string.gsub(/["á","ằ","à","ả","ạ","ã","ă","ắ","ằ","ặ","ẵ","ấ","ầ","ẩ","ậ","ẫ","â"]/,"a")
				@convert=@convert.gsub(/["ê","ế","ể","ệ","ễ","é","ẻ","è","ẽ","ẹ","é"]/,"e")
				@convert=@convert.gsub(/["ô","ổ","ồ","ố","ộ","ó","ò","ỏ","õ","ọ","ơ","ỡ","ở","ợ","ờ","ớ"]/,"o")
				@convert=@convert.gsub(/["ư",'ử','ứ','ữ','ự','ừ','ú','ủ','ù','ụ','ũ']/,"u")
				@convert=@convert.gsub(/["í",'ỉ','ì','ị','ĩ']/,"i")
				@convert=@convert.gsub(/["ý",'ỷ','ỳ','ỵ','ỹ']/,"y")
				@convert=@convert.gsub(/["đ"]/,"d")
				@convert=@convert.gsub(/["%","@","&",'%20','"',"'",'“','”',"."]/,"")
				@convert=@convert.gsub(/["---","--"," "]/,"-")
				return @convert
	end
end
