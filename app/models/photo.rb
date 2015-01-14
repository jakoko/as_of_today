class Photo
	include Mongoid::Document

	mount_uploader :photo_image, PictureUploader
	field :remove_photo_image

	belongs_to :portfolio
end