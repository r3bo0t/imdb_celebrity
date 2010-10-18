require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Celebrity Spec" do
  
  before(:all) do
    @celeb1 = ImdbCelebrity::Celebrity.new("0000093", "brad pitt")
    @celeb2 = ImdbCelebrity::Celebrity.new("0000093", "brad pitt", "NokogiriParser")
  end
  
  after :all do
    @celeb1 = nil
    @celeb2 = nil
  end
  
  it "should use the Hpricot as default parser class" do
    #celeb = ImdbCelebrity::Celebrity.new("0000093", "brad pitt")
    @celeb1.parser.class.should == ImdbCelebrity::Parser::HpricotParser::CelebrityBioParser
  end
  
  it "should use the Parser class with Parser type we are sending" do
    #celeb = ImdbCelebrity::Celebrity.new("0000093", "brad pitt", "NokogiriParser")
    @celeb2.parser.class.should == ImdbCelebrity::Parser::NokogiriParser::CelebrityBioParser
  end
  
  it "should return biography of the celebrity" do
    @celeb1.biography.should == "Brad Pitt was born in 1963 in Oklahoma and raised in Springfield, Missouri. His mother's name is Jane Etta Hillhouse. His father, William (Bill) Pitt, worked in management at a trucking firm in Springfield. He has a younger brother, Douglas (Doug) Pitt and a younger sister Julie Neal Pitt. At Kickapoo High School, Pitt was involved in sports, debating, student government and school musicals. Pitt attended the University of Missouri, where he majored in journalism with a focus on advertising. He occasionally acted in fraternity shows. He left college two credits short of graduating to move to California. Before he became successful at acting, Pitt supported himself by driving strippers in limos, moving refrigerators and dressing as a giant chicken while working for \"el Pollo Loco.\""
    @celeb1.parser.stub!(:biography).and_return("Incosistent Data")
    @celeb1.biography.should_not == "Inconsistent Data"
  end
  
  it "should return height of the celebrity" do
    @celeb1.height.should == "(1.80 m)"
    @celeb1.parser.stub!(:height).and_return("1.9m")
    @celeb1.height.should_not == "1.9m"
  end
  
  it "should return nationality of the celebrity" do 
    @celeb1.nationality.should == "Shawnee, Oklahoma, USA"
    @celeb1.parser.stub!(:nationality).and_return("New Jersy, USA")
    @celeb1.nationality.should_not == "New Jersy, USA"
  end
  
  it "should return array of attribute accessors of celebrity" do
    @celeb1.to_s.class.should == Array
    @celeb1.to_s.length.should == 7
  end
  
end