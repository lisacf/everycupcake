class Mastercake < ActiveRecord::Base
	belongs_to :user
	has_many :recipes, :through => :cakecombos
	has_many :cakecombos
	has_many :ratings, as: :rateable
	has_many :reviews, as: :reviewable
	
	validates_presence_of :name, :source, :description
	validates :description, length: {maximum: 200}
	validates :name, length: {maximum: 40}
	# ADD AN IMAGE WITH PAPERCLIP

	# has_attached_file :image, styles: {
	# 	thumb: '190x150^'}, convert_options: {thumb: "-gravity center -extent 190x150"}
	
	# Add an image with Carrierwave
	mount_uploader :image, ImageUploader

	# PROCESS IMAGE AFTER SAVE FOR AMAZON S3 and CarrierWave DIRECT
	# after_save :enqueue_image

	# def image_name
	# 	File.basename(image.path || image.filename) if image
	# end

	# def enqueue_image
	# 	ImageWorker.perform_async(id, key) if key.present?
	# end
	# class ImageWorker
	# 	include Sidekiq::Worker

	# 	def perform(id, key)
	# 		mastercake = Mastercake.find(id)
	# 		mastercake.key = key
	# 		mastercake.remote_image_url = mastercake.image.direct_fog_url(with_path: true)
	# 		mastercake.save!
	# 		mastercake.update_column(:image_processed, true)
	# 	end
	# end
end
