
class User < ApplicationRecord
	has_secure_password
	has_many :comments 
	validates :name, presence: true, on: :create #format: { with: /\a[a-zA-Z]+\z/,message: "chỉ bao gồm các chữ cái" }
	VALID_EMAIL= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true ,uniqueness: true,format: {with:VALID_EMAIL},on: :create
	validates :password,confirmation: true,on: :create
	validates :password_confirmation,length: {in:6..20},on: :create
	before_create :create
	private 
	def create
		self.role="user"
		self.email=email.downcase
		self.active="unactive"
	end
end
