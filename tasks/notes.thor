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

  desc 'list', 'List all release notes scrapers and generators'

  def list

    Dir.new('./public/releaseNotes').each_child do |child|
      puts File.basename(child, '.*')
    end

  end

  private

  def textScraper(note)
    require_relative "../app/releaseNotes/#{note}.rb"

    eval "#{note.capitalize}.textExtractor"
    eval "#{note.capitalize}.makeHtml"
  end

end
