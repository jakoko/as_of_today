class User
    include Mongoid::Document
    include BCrypt
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
    validates :first_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, 
              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :password, length: { in: 6..20 }, confirmation: true, on: :create

    # Setting relational link with Portfolio model
    has_many :portfolios, dependent: :destroy
    accepts_nested_attributes_for :portfolios

    # Use Carrierwave to upload a profile picture
    mount_uploader :profile_pic, PictureUploader
    field :remove_profile_pic

    # Encrypted user's password
    field :password_digest
    attr_reader :password

    # A setter method to encrypt user's actual password
    def password=(unencrypted_password)
        unless unencrypted_password.empty?
            @password = unencrypted_password
            self.password_digest = BCrypt::Password.create(unencrypted_password)
        end
    end

    # Authenticate user via password
    def authenticate(unencrypted_password)
        if BCrypt::Password.new(self.password_digest) == unencrypted_password
            return self
        else
            return false
        end
    end
end