class Portfolio
	include Mongoid::Document
	# include Mongoid::Slug
	field :title
	# slug :title, :scope => :user

	field :description
	field :venue
	field :location # State in US
	field :style

	belongs_to :user
	
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos

	validates_presence_of :title
end