require 'imdb_celebrity/parser/nokogiri_parser/nokogiri_parser'

module ImdbCelebrity
  module Parser
    module NokogiriParser
      class SearchParser < ImdbCelebrity::Parser::NokogiriParser::NokogiriParser
        def initialize uri
          super uri
        end
        
        def exact_match?
          !document.at("h3[text()^='Overview']").nil?
        end
        
        def parse_celebrities parser
          document.search('a[@href^="/name/nm"]').reject do |element|
            element.to_html.imdb_strip_tags.empty? ||
            element.parent.to_html =~ /media from/i
          end.map do |element|
            id = element['href'][/\d+/]

            data = element.parent.to_html.split("<br />")
            if !data[0].nil? && !data[1].nil? && data[0] =~ /img/
              title = data[1]
            else
              title = data[0]
            end

            title = title.imdb_strip_tags.imdb_unescape_html
            title.gsub!(/\s+\(\d{4}\)$/, '')

            [id, title, parser]
          end
        end
      
      end
    end
  end
end