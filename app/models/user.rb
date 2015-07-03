class User < ActiveRecord::Base
	
	has_many :expense
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true
	validates :email, presence: true, format: {with:VALID_EMAIL_REGEX}
	validates :password, presence: true, length: {minimum: 6}
	has_secure_password
	validates :password_confirmation, presence: true
    # attr_accessible :email, :password, :password_confirmation, :name
	
end
