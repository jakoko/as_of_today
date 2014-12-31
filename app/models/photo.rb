class Photo
	include Mongoid::Document
	field :caption
	field :venue
	field :date
	field :photo_url

	belongs_to :portfolio
end