class User
    include Mongoid::Document
    field :first_name
    field :last_name
    field :email
    field :state

    field :role
    field :about_me
    field :personal_website
    field :style

    has_many :portfolios

    mount_uploader :profile_pic, ProfilePicUploader
    field :remove_profile_pic

    validates_presence_of :first_name
end