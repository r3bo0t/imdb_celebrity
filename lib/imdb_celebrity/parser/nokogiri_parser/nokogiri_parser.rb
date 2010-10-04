require 'nokogiri'

module ImdbCelebrity
  module Parser
    module NokogiriParser
      class NokogiriParser
        
        def initialize uri
          @page = uri
        end
        
        protected
        
        def document
          @document ||= Nokogiri::HTML(open(URI.encode(@page), "User-Agent" => "ruby"))
        end
        
      end
    end
  end
end