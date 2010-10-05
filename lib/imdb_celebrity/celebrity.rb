require 'imdb_celebrity/parser/hpricot_parser/celebrity_bio_parser'
require 'imdb_celebrity/parser/nokogiri_parser/celebrity_bio_parser'
module ImdbCelebrity
  #Represents a celebrity on IMDB.com
  class Celebrity
    attr_accessor :id, :url, :name, :parser, :real_name, :biography, :height, :nationality
    
    # Initialize a new IMDB celebrity object with it's IMDB id (as a String)
    #
    #   celebrity = Imdb::Celebrity.new("0095016")
    #
    # Imdb::Celebrity objects are lazy loading, meaning that no HTTP request
    # will be performed when a new object is created. Only when you use an 
    # accessor that needs the remote data, a HTTP request is made (once).
    #
    
    def initialize imdb_id, title = nil, parser = "HpricotParser"
      @id = imdb_id
      @url = "http://www.imdb.com/name/nm#{imdb_id}/bio"
      @name = title.gsub(/"/, "") if title
      @parser = initialize_parser parser
    end
    
    def to_s
      [@id, @url, @name, @real_name, @biography, @height, @nationality]
    end
    
    def name(flag=false)
      if flag==true
        @name = @parser.name
      else
        @name ||= @parser.name
      end
    end
    
    def real_name
      @real_name ||=@parser.real_name
    end
    
    def biography
      @biography ||= @parser.biography
    end
    
    def height
      @height ||= @parser.height
    end
    
    def nationality
      @nationality ||= @parser.nationality
    end
    
    def celebrity_data
      @real_name ||=@parser.real_name
      @biography ||= @parser.biography
      @height ||= @parser.height
      @nationality ||= @parser.nationality
      return true
    end
    
    private
    
    def document
      @document ||= Hpricot(Imdb::Celebrity.find_by_id(@id)) 
    end
    
    def self.find_by_id imdb_id
      open("http://www.imdb.com/name/nm#{imdb_id}/")
    end
    
    def initialize_parser parser
      return ImdbCelebrity::Parser::HpricotParser::CelebrityBioParser.new(@url) if parser == "HpricotParser"
      return ImdbCelebrity::Parser::NokogiriParser::CelebrityBioParser.new(@url) if parser == "NokogiriParser"
    end
    
  end
end