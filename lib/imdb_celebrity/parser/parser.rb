module ImdbCelebrity
  module Parser
    module Parser
      def name
        document.at("h1").inner_html rescue nil
      end
      
      def real_name
        document.at("h5[text()*='Birth Name']").next.inner_text.strip rescue nil
      end
      
      def nationality
        document.at("a[@href*='birth_place']").inner_text.strip rescue nil
      end
      
      def height
        document.at("h5[text()*='Height']").next.inner_text[/\(.+\)/] rescue nil
      end
      
      def biography
        document.at("h5[text()*='Biography']").next_sibling.inner_text rescue nil
      end
    end
  end
end
