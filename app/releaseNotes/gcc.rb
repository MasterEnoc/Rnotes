require_relative '../htmlGenerator/htmlTextScraper'

class Gcc < HtmlTextGenerator
  self.url =  'https://gcc.gnu.org/gcc-10/changes.html'

  def self.htmlCleaner(nodeSet)
    nodeSet.css('.copyright').remove
    nodeSet
  end
end
