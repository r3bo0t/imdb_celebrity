require File.dirname(__FILE__) + "/../../../spec_helper.rb"

describe "Celebrity Bio Parser Spec" do
    
  before :all do 
    @celeb_bio_h = ImdbCelebrity::Parser::HpricotParser::CelebrityBioParser.new("http://www.imdb.com/name/nm0000093/bio")
  end
  
  after :all do 
    @celeb_bio_h = nil
  end
  
  it "should extend Parser module" do
    @celeb_bio_h.extend ImdbCelebrity::Parser::Parser
  end
  
  it "should extend HpricotParser/NokogiriParser Class" do
    @celeb_bio_h.class.superclass.should == ImdbCelebrity::Parser::HpricotParser::HpricotParser
  end
    
end
