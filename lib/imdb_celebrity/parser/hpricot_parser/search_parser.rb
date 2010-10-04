require 'imdb_celebrity/parser/hpricot_parser/hpricot_parser'
module ImdbCelebrity
  module Parser
    module HpricotParser
      class SearchParser < ImdbCelebrity::Parser::HpricotParser::HpricotParser
        
        def initialize uri
          super uri
        end
        
        # Returns true if search returns specificly only one result, exact match
        def exact_match?
          #!document.at("//h3[text()^='Overview'/..]").nil?
          !document.at("//h3[text()^='Overview']/..").nil?
        end

        def parse_celebrities parser
          document.search('a[@href^="/name/nm"]').reject do |element|
            element.innerHTML.imdb_strip_tags.empty? ||
            element.parent.innerHTML =~ /media from/i
          end.map do |element|
            id = element['href'][/\d+/]

            data = element.parent.innerHTML.split("<br />")
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