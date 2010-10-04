require 'hpricot'

module ImdbCelebrity
  module Parser
    module HpricotParser
      class HpricotParser
        attr_reader :page
      
        def initialize uri
          @page = uri
        end
      
        protected
       
        def document
          @document ||= Hpricot(open(URI.encode(@page), "User-Agent" => "ruby"))
        end
    
      end
    end
  end
end