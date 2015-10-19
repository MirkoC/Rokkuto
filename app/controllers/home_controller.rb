class HomeController < ApplicationController
  def index
  end

  def documentation
    m = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true,
                                tables: true, fenced_code_blocks: true, :hard_wrap => true)
    @content = m.render(File.open(Rails.root + 'app/views/home/docs.md', 'r').read)
  end
end
