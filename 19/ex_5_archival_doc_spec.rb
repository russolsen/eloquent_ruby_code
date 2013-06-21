require '../utils/rspec_utils'


class ArchivalDocument                        ##(main
  attr_reader :title, :author 

  def initialize(title, author,  path) 
    @title = title 
    @author = author
    @path = path 
  end 

  def content 
    @content ||= File.read( @path ) 
  end 
end                                           ##main)



describe ArchivalDocument do
  before :each do
    File.open( 'archive.txt', 'w' ) {|f| f.puts("hello out there")}
  end

  it 'know how to load from a file' do
    doc = ArchivalDocument.new( 'Archive doc', 'russ', 'archive.txt' )
    doc.instance_variable_get(:@content).should == nil
    doc.content.should == "hello out there\n"
    doc.instance_variable_get(:@content).should_not == nil
    File.delete('archive.txt')
    doc.content.should == "hello out there\n"    
  end
end

