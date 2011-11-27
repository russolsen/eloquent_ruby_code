$: << "#{File.dirname(__FILE__)}/../lib"

require 'document'

describe Document do

  before :each do
    @document = Document.new( 'test', 'russ', 'nothing' )
  end

  it "should hold onto the title, author and content" do
    @document.title.should == 'test'
    @document.author.should == 'russ'
    @document.content.should == 'nothing'
  end

  it "should be able to split content into words" do
    @document.content = 'the rain in spain'
    @document.words.should == %w{ the rain in spain }
  end
end
