class TemplateGenerator

  class << self
    attr_accessor :url, :content

    def inherited(subclass)
      subclass.url = @url
    end

    def makeHtml
      newFile = File.new("./public/releaseNotes/#{self.name.downcase}.html", 'w')

      IO.write(newFile, %{
      <section id="#{self.name.downcase}">
        #{content}
      </section>
    })
    end

  end
end
