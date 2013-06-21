require '../code/doc3'
require '../utils/rspec_utils'

class Document                       ##(main

  # Most of the class omitted...

  def load( path )
    @content = File.read( path )
    on_load(path)
  end

  def save( path )
    File.open( path, 'w') { |f| f.print( @content ) }
    on_save(path)
  end

  def on_load( path )
  end

  def on_save( path )
  end
end

class ChattyDocument < Document

  def on_load( path )
    puts "Hey, I've been loaded from #{path}!"
  end

  def on_save( path )
    puts "Hey, I've been saved to #{path}!"
  end
end                                  ##main)

describe Document do
  before :each do
    File.delete("example.txt") if File.exist?("example.txt")
  end

  it 'should save and load without problems' do
    doc = Document.new( 'example', 'russ', 'the rain in spain')
    doc.save( 'example.txt' )
    new_doc = Document.new( 'example', 'russ', 'hello' )
    new_doc.load( 'example.txt')
    new_doc.content.should == doc.content
  end
end


describe ChattyDocument do
  it 'should comment on what is going on' do
    doc = ChattyDocument.new( 'example', 'russ', 'the rain in spain')
    out = output_of { doc.save( 'example.txt' ) }

    out.should match(/Hey.*saved.*example.txt/m)

    new_doc = ChattyDocument.new( 'example', 'russ', 'hello' )
    out = output_of { new_doc.load( 'example.txt') }

    out.should match(/Hey.*loaded.*example/m)

    new_doc.content.should == doc.content
  end
end
