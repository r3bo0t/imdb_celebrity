require File.dirname(__FILE__) + "/../../../spec_helper.rb"

describe "Celebrity Bio Parser Spec" do
    
  before :all do 
    @parser = ImdbCelebrity::Parser::HpricotParser::CelebrityBioParser.new("http://www.imdb.com/name/nm0000093/bio")
  end
  
  after :all do 
    @parser = nil
  end
  
  it "should extend Parser module" do
    @parser.extend ImdbCelebrity::Parser::Parser
  end
  
  it "should extend HpricotParser/NokogiriParser Class" do
    @parser.class.superclass.should == ImdbCelebrity::Parser::HpricotParser::HpricotParser
  end
    
end
