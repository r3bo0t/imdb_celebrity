require File.dirname(__FILE__) + "/../../spec_helper.rb"

# dummy class created to test module's functionality
class ParserDummy 
  include ImdbCelebrity::Parser::Parser
  def initialize uri
    @page = uri
  end
  protected
  def document
    @document ||= Hpricot(open(URI.encode(@page), "User-Agent" => "ruby"))
  end
end

describe "Parser Spec" do
  
  before :all do
    @parser_dummy = ParserDummy.new("http://imdb.com/name/nm0000093/bio")
  end
  
  after :all do
    @parser_dummy = nil
  end
  
  it "should return the celebrity real_name" do
    @parser_dummy.real_name.should == "William Bradley Pitt"
  end
  
  it "should return celebrity biography" do 
    @parser_dummy.biography.should == "Brad Pitt was born in 1963 in Oklahoma and raised in Springfield, Missouri. His mother's name is Jane Etta Hillhouse. His father, William (Bill) Pitt, worked in management at a trucking firm in Springfield. He has a younger brother, Douglas (Doug) Pitt and a younger sister Julie Neal Pitt. At Kickapoo High School, Pitt was involved in sports, debating, student government and school musicals. Pitt attended the University of Missouri, where he majored in journalism with a focus on advertising. He occasionally acted in fraternity shows. He left college two credits short of graduating to move to California. Before he became successful at acting, Pitt supported himself by driving strippers in limos, moving refrigerators and dressing as a giant chicken while working for \"el Pollo Loco.\""
  end
  
  it "should return celebrity height" do
    @parser_dummy.height.should == "(1.80 m)"
  end
  
  it "should return celebrity nationality" do
    @parser_dummy.nationality.should == "Shawnee, Oklahoma, USA"
  end
  
  it "should return celebrity name" do
    @parser_dummy.name.should == "Brad Pitt"
  end
  
end