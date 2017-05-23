class User < ApplicationRecord
	has_many :comments
	before_create :create
	private 
	def create
		self.role="user"
	end
end
