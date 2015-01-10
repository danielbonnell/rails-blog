module AvatarHelper
  def avatar
    if !current_user.avatar.url.nil?
      image_tag current_user.avatar,
        size: "150", 
        alt: "#{current_user.username}'s Avatar"
    else
      image_tag current_user.gravatar_url,
        size: "150",
        alt: "#{current_user.username}'s Avatar"
    end
  end
end
