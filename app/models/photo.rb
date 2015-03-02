class Photo
	include Mongoid::Document

	mount_uploader :photo_image, PictureUploader
	field :remove_photo_image
  
  # process_in_background :photo_image
  field :photo_image_processing, type: Boolean, default: false

	belongs_to :portfolio
end