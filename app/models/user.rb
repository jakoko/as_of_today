class User
    include Mongoid::Document
    field :first_name
    field :last_name
    field :email
    field :profile_pic
    field :state

    field :role
    field :about_me
    field :personal_website
    field :email
    field :style

    has_many :portfolios

    validates_presence_of :first_name, :state
end