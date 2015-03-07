module UsersHelper

  def user_profile_pic(user)
    return user.profile_pic unless user.profile_pic.blank?
    return image_url('no_image.jpeg')
  end

end