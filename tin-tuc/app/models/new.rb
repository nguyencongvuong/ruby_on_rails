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
				@convert=@convert.gsub(/["ô","ổ","ồ","ố","ộ","ó","ò","ỏ","õ","ọ","ơ","ỡ","ở","ợ","ờ","ớ"]/,"o")
				@convert=@convert.gsub(/["ư",'ử','ứ','ữ','ự','ừ','ú','ủ','ù','ụ','ũ']/,"u")
				@convert=@convert.gsub(/["í",'ỉ','ì','ị','ĩ']/,"i")
				@convert=@convert.gsub(/["ý",'ỷ','ỳ','ỵ','ỹ']/,"y")
				@convert=@convert.gsub(/["đ"]/,"d")
				@convert=@convert.gsub(/["{",'}',"!",'“','”']/,"") 
				
				@convert=@convert.gsub!(/["%","@","&",'"',"'",".","  "]/," ")
				@convert=@convert.gsub!(/["---","--",","," – ","–","|","_","+"]/,"-")
				return @convert
	end
end
