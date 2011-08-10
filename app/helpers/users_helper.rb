module UsersHelper
  def gravatar_for(user,options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

  def current_user?(user)
    current_user == user
  end
end
