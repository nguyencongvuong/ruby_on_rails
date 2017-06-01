class New < ApplicationRecord
	has_many :comments,dependent: :destroy
	belongs_to :category 
	belongs_to :user
	default_scope { order('created_at DESC') }
	include ApplicationHelper
	validates :title,presence:true
	validates :content,presence:true
	before_save :slug_new
	before_update :around_save
	private
	def slug_new(id="")
		if id==""
			if New.last.nil?
				@id=0
			else
				@id_first=New.first.id
				@id_last=New.last.id
				if @id_first > @id_last 
					@id=@id_first
				else 
					@id=@id_last 
				end
			end
		self.slug=convert(title)+"-"+"#{@id+1}"
		else
		self.slug=convert(title)+"-"+"#{id}"
		end
	end
	private
	def around_save
		return slug_new(id)
	end
	def convert(string)
        @convert=string.mb_chars.downcase
        @convert=@convert.gsub(/[áằàảạãăắằặẵấầẩậẫâ]/,"a")
        @convert=@convert.gsub(/[êếểệễềéẻèẽẹé]/,"e")
        @convert=@convert.gsub(/[ôổồốộóòỏõọơỡởợờỗớ]/,"o")
        @convert=@convert.gsub(/[ưửứữựừúủùụũ]/,"u")
        @convert=@convert.gsub(/[íỉìịĩ]/,"i")
        @convert=@convert.gsub(/[ýỷỳỵỹ]/,"y")
        @convert=@convert.gsub(/[đ]/,"d")
        @convert=@convert.gsub(/[{}!“”.…–:?]/,'')
        @convert=@convert.gsub( /\[/,'')
        @convert=@convert.gsub( /\]/,'')
        @convert=@convert.gsub(/[%@&",'"',"'","  ","   "]/," ")
        @convert=@convert.gsub(/  /," ")
        @convert=@convert.gsub(/["---","--",",","\/","\\","|","_","+",' ']/,"-")
        # @convert=@convert.gsub(/" "/,"-")
        return @convert
  end
end
