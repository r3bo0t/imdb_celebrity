require 'imdb_celebrity/parser/hpricot_parser/hpricot_parser'
require 'imdb_celebrity/parser/parser'

module ImdbCelebrity
  module Parser
    module HpricotParser
      class CelebrityBioParser < ImdbCelebrity::Parser::HpricotParser::HpricotParser
        include ImdbCelebrity::Parser::Parser
        
        def initialize uri
          super(uri)
        end

      end
    end
  end
end
