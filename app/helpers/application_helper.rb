module ApplicationHelper
  def profile_img(user)
    if user.avatar?
      image_tag(user.avatar.thumb.url, alt: user.name)
    else
      image_tag('no_image.png', alt: user.name)
    end
  end
end