require 'imdb_celebrity/parser/hpricot_parser/search_parser'
require 'imdb_celebrity/parser/nokogiri_parser/search_parser'

module ImdbCelebrity

  class Search
    attr_reader :query, :parser
    
    def initialize(query, parser ="HpricotParser")
      @query = search_uri query
      @parser_text = parser
      @parser = initialize_parser parser
    end
    
    def celebrities
      @celebrities = (@parser.exact_match? ? @parser.parse_celebrity : parse_celebrities)
    end
    
    private
    
    def search_uri query
      "http://imdb.com/find?s=nm&q=#{query}"
    end
    
    def parse_celebrity
      id = @document.at("head/link[@rel='canonical']")[:href][/\d+/]
      name = @document.at("h1").inner_html.split('<span').first.inner_text.imdb_unescape_html
      [ImdbCelebrity::Celebrity.new(id, name, @parser_text)]
    end
    
    def parse_celebrities
      celebrities = @parser.parse_celebrities @parser_text
      celebrities.uniq.map do |values|
        ImdbCelebrity::Celebrity.new(*values)
      end      
    end
    
    def initialize_parser parser
      return ImdbCelebrity::Parser::HpricotParser::SearchParser.new(@query) if parser == "HpricotParser"
      return ImdbCelebrity::Parser::NokogiriParser::SearchParser.new(@query) if parser == "NokogiriParser"
    end
    
  end
  
end