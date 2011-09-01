module MenusHelper
  def menus_options
    options_for_select(current_user.menu_names)
  end
end
