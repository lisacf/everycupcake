class User < ActiveRecord::Base
	before_save { self.email = email.downcase! }
	validates_presence_of :name, :email, :screen_name
	validates :name, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, format: { with: VALID_EMAIL_REGEX }, 
					  uniqueness: { case_sensitive: false }
	validates :screen_name, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	has_secure_password
end
