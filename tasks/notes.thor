class Notes < Thor
  desc 'generate <note>', 'Generate HTML file with the release note of <note>'
  method_option :all, :aliases => '-A', :type => :boolean, :desc => 'Download all release notes'

  def generate(note=nil)

    if options[:all]
      return Dir.new("./app/releaseNotes").each_child do |child|
        textScraper(File.basename(child, '.*'))
      end
    end

    if note.nil?
      return puts 'Error: <note> was not specified'
    end

    if File.exist?("./app/releaseNotes/#{note}.rb")
      return  textScraper(note)
    end

    puts 'File cannot be generated'
    puts 'Run <thor notes:list> to see what files can be generated'

  end

  desc 'list', 'List all release notes scrapers'

  def list
    directoryShow('./app/releaseNotes')
  end

  desc 'downloaded', 'List all scraped release notes'

  def downloaded
    directoryShow('public/releaseNotes')
  end

  private

  def textScraper(note)
    require_relative "../app/releaseNotes/#{note}.rb"

    eval "#{note.capitalize}.textExtractor" # Call the class and use its class method
    eval "#{note.capitalize}.makeHtml"      # Use the second class method to make an html file
  end

  def directoryShow(url)
    Dir.new(url).each_child do |child|
      puts File.basename(child, '.*')
    end
  end

end
