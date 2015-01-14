# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end


  #####################
  # CUSTOM METHODS
  #####################

  # Creates 400 x 400 picture only for User model
  process resize_to_fit: [300, 300], if: :is_User_model?


  # Create 3 versions for Photo model
  # Large size
  process resize_to_fit: [900, 1200], if: :is_Photo_model?

  # Normal size
  version :normal, if: :is_Photo_model? do 
    process resize_to_fit: [400, 400]
  end

  # Thumb size
  version :thumb, if: :is_Photo_model?, from_version: :normal do
    process resize_to_fit: [250, 250]
  end

  protected
  def is_Photo_model? picture
    model.class == Photo
  end

  def is_User_model? picture
    model.class == User
  end

  #####################
  #####################

  # def scale(width, height)
  #   # do something
  # end

  # version :full do
  #     process :resize_to_fit => [1024, 768]
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end