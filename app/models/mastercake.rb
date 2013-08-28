class Mastercake < ActiveRecord::Base
	belongs_to :user
	has_many :recipes, :through => :cakecombos
	has_many :cakecombos

	mount_uploader :image, ImageUploader
	
end
