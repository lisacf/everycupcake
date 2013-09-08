class Mastercake < ActiveRecord::Base
	belongs_to :user
	has_many :recipes, :through => :cakecombos
	has_many :cakecombos
	has_many :ratings, as: :rateable
	has_many :reviews, as: :reviewable
	
	validates_presence_of :name, :source, :description
	validates :description, length: {maximum: 200}
	validates :name, length: {maximum: 40}

	mount_uploader :image, ImageUploader

	
end
