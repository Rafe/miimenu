module MarkdownHelper
  def to_html(markdown)
    Maruku.new(markdown).to_html
  end
end
