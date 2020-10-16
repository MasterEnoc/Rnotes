class TemplateGenerator
  require 'nokogiri'
  require 'open-uri'

  class << self
    attr_accessor :url, :content

    def inherited(subclass)
      subclass.url = @url
    end

    def makeHtml
      newFile = File.new("./public/releaseNotes/#{self.name.downcase}.html", 'w')

      IO.write(newFile, %{
      <section class="container" id="#{self.name.downcase}">
      <pre>
        #{content}
      </pre>
      </section>
    })
    end

  end
end
