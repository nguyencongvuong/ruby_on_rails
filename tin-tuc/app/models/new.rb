class New < ApplicationRecord
	has_many :comments,dependent: :destroy
	include ApplicationHelper
	validates :title,presence:true
	validates :content,presence:true
	belongs_to :category 

	before_create :convert
	before_update :around_save
	private
	def convert(id="")
		if id==""
			if New.last.nil?
				@id_last=0
			else
				@id_last=New.last.id
			end
		self.slug=convert_string(title)+"-"+"#{@id_last+1}"
		else
		self.slug=convert_string(title)+"-"+"#{id}"
		end
	end
	private
	def around_save
		return convert(id)
	end
end
