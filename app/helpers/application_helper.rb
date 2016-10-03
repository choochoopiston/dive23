module ApplicationHelper

def avatar_sm(user)
  avatar_img(user, "small")
end

def avatar_md(user)
  avatar_img(user, "medium")
end

def avatar_lg(user)
  avatar_img(user, "large")
end

  private
  def avatar_img(user,size)
    if user.avatar?
      case size
        when "small"
          image_tag(user.avatar.small, alt: user.name)
        when "medium"
          image_tag(user.avatar.medium, alt: user.name)
        when "large"
          image_tag(user.avatar.large, alt: user.name, class: "img-responsive", style: "margin: 0 auto;")
        else
          image_tag(user.avatar, alt: user.name)
      end
    else
      case size
        when "small"
          image_tag('no_image_32.png', alt: user.name)
        when "medium"
          image_tag('no_image_48.png', alt: user.name)
        when "large"
          image_tag('no_image_164.png', alt: user.name, class: "img-responsive", style: "margin: 0 auto;")
        else
          image_tag('no_image.png', alt: user.name)
      end
    end
  end
end