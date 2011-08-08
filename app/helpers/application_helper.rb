require 'maruku'

module ApplicationHelper
  def to_html(markdown)
    Maruku.new(markdown).to_html
  end
end
