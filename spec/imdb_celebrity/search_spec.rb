require File.dirname(__FILE__) + "/../spec_helper.rb"

describe "Search Spec" do
  
  before :all do
    @search1 = ImdbCelebrity::Search.new("Brad Pitt")
    @search2 = ImdbCelebrity::Search.new("Brad Pitt", "NokogiriParser")
  end
  
  after :all do
    @search1 = nil
    @search2 = nil
  end
  
  it "should use hpricot as defualt parsing class" do
    @search1.parser.class.should == ImdbCelebrity::Parser::HpricotParser::SearchParser
  end
  
  it "should use the parsing class which we want" do
    @search2.parser.class.should == ImdbCelebrity::Parser::NokogiriParser::SearchParser
  end
  
  it "should return the celbrities list with given search string" do
    @search1.celebrities.class.should == Array
    @search1.celebrities.should_not == []
  end
  
end