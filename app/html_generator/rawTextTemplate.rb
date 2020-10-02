require_relative 'template'

class RawTextGenerator < TemplateGenerator
  require 'nokogiri'
  require 'open-uri'

  class << self
    attr_accessor :content

    def rawTextExtractor
      rdoc = Nokogiri::HTML(URI.open(@url))
      @content = rdoc.css('body').inner_text
    end
  end

end
