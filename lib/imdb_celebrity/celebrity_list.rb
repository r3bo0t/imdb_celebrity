module  ImdbCelebrity
  
  class CelebrityList
  
    def celebrities
      @celebrities ||= parse_celebrities
    end
    
    private
    
    def parse_celebrities
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
        
        [id, title]
      end.uniq.map do |values|
        ImdbCelebrity::Celebrity.new(*values)
      end      
    end
  
  end
  
end