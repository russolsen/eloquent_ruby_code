require '../utils/rspec_utils'


class BlockBasedArchivalDocument              ##(main
  attr_reader :title, :author 

  def initialize(title, author, &block) 
    @title = title 
    @author = author
    @initializer_block = block 
  end 

  def content
    if @initializer_block 
      @content = @initializer_block.call 
      @initializer_block = nil 
    end 
    @content 
  end 
end                                          ##main)

require 'net/http' 

describe BlockBasedArchivalDocument do
  it 'should be able to load from a file' do
    File.open( 'some_text.txt', 'w' ) {|f| f.puts("hello out there")}

    file_doc =  BlockBasedArchivalDocument.new( 'file', 'russ' ) do ##(from_file
      File.read( 'some_text.txt' )
    end                                                                  ##from_file)

    file_doc.instance_variable_get(:@content).should == nil
    file_doc.content.should == "hello out there\n"
    file_doc.instance_variable_get(:@content).should_not == nil

    File.delete( 'some_text.txt' )

    file_doc.content.should == "hello out there\n"
  end

  it 'should be able to load from http' do
    google_doc = BlockBasedArchivalDocument.new('http', 'russ') do   ##(from_http
      Net::HTTP.get_response('www.google.com', '/index.html').body 
    end                                                                  ##from_http)
puts google_doc
    google_doc.content.should match(/html/)
  end

  it 'should be able to load from http' do
    boring_doc = BlockBasedArchivalDocument.new('silly', 'russ') do      ##(silly
      'Ya' * 100
    end                                                                  ##silly)
    boring_doc.content.should match( /YaYaYa/ )
  end 
end


