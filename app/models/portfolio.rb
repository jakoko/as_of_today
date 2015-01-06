class Portfolio
	include Mongoid::Document
	field :title
	field :description
	field :venue
	field :location

	belongs_to :user
	has_many :photos

	validates_presence_of :title
end