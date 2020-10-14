require_relative 'template'

class HtmlTextGenerator < TemplateGenerator
  require 'nokogiri'
  require 'open-uri'

  class << self
    attr_accessor :content

    def textExtractor
      @content = htmlCleaner(Nokogiri::HTML(URI.open(@url)))
    end

    def htmlCleaner(nodeSet)
      nodeSet.css('body')
    end

    def makeHtml
      newFile = File.new("./public/releaseNotes/#{self.name.downcase}.html", 'w')

      IO.write(newFile, %{ #{content} })
    end

    def makeHtml
      newFile = File.new("./public/releaseNotes/#{self.name.downcase}.html", 'w')
      IO.write(newFile, %{ #{content} })
    end

  end
end
