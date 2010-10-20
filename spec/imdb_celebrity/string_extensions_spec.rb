require File.dirname(__FILE__) + "/../spec_helper.rb"

class String
  include ImdbCelebrity::StringExtensions
end

describe "String Extensions Spec" do
  
  before :all do
    @dummy = "<small>(Actor, <a href='/title/tt0114369/'>Se7en</a> (1995))</small>"
  end
  
  after :all do
    @dummy = nil
  end
  
  it "should unescape the html from a string literal" do
    @dummy.imdb_unescape_html.should == "<small>(Actor, <a href='/title/tt0114369/'>Se7en</a> (1995))</small>"
  end
  
  it "should strip the html tag from the string" do
    @dummy.imdb_strip_tags.should == "(Actor, Se7en (1995))"
  end
  
  it "should strip out the white space and check whether string is empty or not" do
    @dummy.blank?.should == false
    demo = "   "
    demo.blank?.should == true
  end
  
end