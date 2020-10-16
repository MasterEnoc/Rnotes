require_relative 'template'

class RawTextGenerator < TemplateGenerator

  class << self
    attr_accessor :content

    def textExtractor
      rdoc = Nokogiri::HTML(URI.open(@url))
      @content = rdoc.css('body').inner_text
    end
  end

end
