module ApplicationHelper
  def avatar_url_for(user, opts={})
    size = opts[:size] || 48

    if user.avatar.attached?
      user.avatar.variant(combine_options: {
        thumbnail: "#{size}x#{size}^",
        gravity: "center",
        extent: "#{size}x#{size}"
      })
    else
      hash = Digest::MD5.hexdigest(current_user.email)
      "https://secure.gravatar.com/avatar/#{hash}.png?height=#{size}&width=#{size}"
    end
  end

  def nav_link_to(title, path, options={})
    options[:class] = Array.wrap(options[:class])
    active_class    = options.delete(:active_class) || "active"
    inactive_class  = options.delete(:inactive_class) || ""

    classes         = (request.path == path) ? active_class : inactive_class
    options[:class] << classes

    link_to title, path, options
  end
end
