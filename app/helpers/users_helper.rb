module UsersHelper

  def user_profile_pic(user)
    return user.profile_pic unless user.profile_pic.nil?
  end

end