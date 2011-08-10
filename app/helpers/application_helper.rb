require 'maruku'

module ApplicationHelper
  include UsersHelper

  def to_html(markdown)
    Maruku.new(markdown).to_html
  end
end
