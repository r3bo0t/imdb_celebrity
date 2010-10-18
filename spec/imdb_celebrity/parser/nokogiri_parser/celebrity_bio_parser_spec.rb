require File.dirname(__FILE__) + "/../../../spec_helper.rb"
require 'nokogiri'

describe "Celebrity Bio Parser Spec" do
    
  before :all do 
    @parser = ImdbCelebrity::Parser::NokogiriParser::CelebrityBioParser.new("http://www.imdb.com/name/nm0000093/bio")
  end
  
  after :all do
    @parser = nil
  end
  
  it "should extend Parser module" do
    @parser.extend ImdbCelebrity::Parser::Parser
  end
  
  it "should extend HpricotParser/NokogiriParser Class" do
    @parser.class.superclass.should == ImdbCelebrity::Parser::NokogiriParser::NokogiriParser
  end
  
  it "should called the overrided methods" do
    # biography() method has been overrided, so it should call class method only
    @parser.biography.should == "Brad Pitt was born in 1963 in Oklahoma and raised in Springfield, Missouri. His mother's name is Jane Etta Hillhouse. His father, William (Bill) Pitt, worked in management at a trucking firm in Springfield. He has a younger brother, Douglas (Doug) Pitt and a younger sister Julie Neal Pitt. At Kickapoo High School, Pitt was involved in sports, debating, student government and school musicals. Pitt attended the University of Missouri, where he majored in journalism with a focus on advertising. He occasionally acted in fraternity shows. He left college two credits short of graduating to move to California. Before he became successful at acting, Pitt supported himself by driving strippers in limos, moving refrigerators and dressing as a giant chicken while working for \"el Pollo Loco.\""
  end
  
  it "should not call the superclass methods for overrided methods" do
    @superparser = ImdbCelebrity::Parser::NokogiriParser::NokogiriParser.new("http://www.imdb.com/name/nm0000093/bio")
    @superparser.stub!(:biography).and_return("Demo Biography")
    @parser.biography.should_not == "Demo Biography"
  end
    
end