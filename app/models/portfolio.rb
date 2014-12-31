class Portfolio
	include Mongoid::Document
	field :title
	field :description
	field :venue
	field :date

	belongs_to :user
	has_many :photos
end