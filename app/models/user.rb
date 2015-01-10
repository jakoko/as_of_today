class User
    include Mongoid::Document
    # include Mongoid::Slug

    field :first_name
    # slug :first_name, type: String

    field :last_name
    field :email
    field :state

    field :role
    field :about_me
    field :personal_website
    field :style

    # 
    has_many :portfolios, dependent: :destroy
    accepts_nested_attributes_for :portfolios

    # 
    mount_uploader :profile_pic, ProfilePicUploader
    field :remove_profile_pic

    # 
    validates_presence_of :first_name
end