class TemplateGenerator

  class << self
    attr_accessor :url, :content

    def inherited(subclass)
      subclass.url = @url
    end

    def makeHtml
      newFile = File.new(self.name+'.html', 'w')

      IO.write(newFile, %{
      <section id="release_note">
        #{content}
      </section>
    })
    end

  end
end
