class New < ApplicationRecord
	include ApplicationHelper
	validates :title,presence:true
	validates :content,presence:true
	belongs_to :category 

	before_create :convert
	before_update :around_save
	private
	def convert(id="")
		if id==""
		self.slug=convert_string(title)+"-"+"#{New.last.id+1}"
		else
		self.slug=convert_string(title)+"-"+"#{id}"
		end
	end
	private
	def around_save
		
		return convert(id)
	end
end
