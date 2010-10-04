require 'imdb_celebrity/parser/nokogiri_parser/nokogiri_parser'
require 'imdb_celebrity/parser/parser'

module ImdbCelebrity
  module Parser
    module NokogiriParser
      class CelebrityBioParser < ImdbCelebrity::Parser::NokogiriParser::NokogiriParser
      
        include ImdbCelebrity::Parser::Parser
        
        def initialize uri
          super uri
        end
        
        def biography
          document.at("h5[text()*='Biography']").next_sibling.next_sibling.inner_text rescue nil
        end
        
      end
    end
  end
end