module ImdbCelebrity

  class Search
    attr_reader :query
    
    def initialize query
      @query = query
    end
    
    def celebrities
      @celebrities = (excat_match? ? parse_celebrity : parse_celebrities)
    end
    
    private
    
    def document
      @document || = Hpricot(ImdbCelebrity::Search.query(@query))
    end
    
    def self.query query
      open("http://imdb.com/find?s=nm&q=#{query}")
    end
    
    def parse_celebrity
      id = @document.at("head/link[@rel='canonical']")[:href][/\d+/]
      title = @document.at("h1").inner_html.split('<span').first.inner_text.imdb_unescape_html
      [ImdbCelebrity::Celebrity.new(id, title)]
    end
    
    # Returns true if search returns specificly only one result, exact match
    def exact_match?
      !@document.at("//h3[text()^='Overview'/..]").nil?
    end
    
  end
  
end