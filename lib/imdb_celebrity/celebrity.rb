module ImdbCelebrity
  #Represents a celebrity on IMDB.com
  class celebrity
    attr_accessor :id, :url, :name
    
    # Initialize a new IMDB celebrity object with it's IMDB id (as a String)
    #
    #   celebrity = Imdb::Celebrity.new("0095016")
    #
    # Imdb::Celebrity objects are lazy loading, meaning that no HTTP request
    # will be performed when a new object is created. Only when you use an 
    # accessor that needs the remote data, a HTTP request is made (once).
    #
    
    def initialize
      
    end
    
    private
    
    def document
      @document || = Hpricot(Imdb::Celebrity.find_by_id(@id)) 
    end
    
    def self.find_by_id imdb_id
      open("http://www.imdb.com/name/nm#{imdb_id}/")
    end
    
  end
end