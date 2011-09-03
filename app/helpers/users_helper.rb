module UsersHelper
  def gravatar_for(user,options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def current_user?(user)
    current_user == user
  end

  def link_to_facebook(description)
    link_to description, user_omniauth_authorize_path(:facebook)
  end

  def link_to_twitter(description)
    link_to description, user_omniauth_authorize_path(:twitter)
  end
end
