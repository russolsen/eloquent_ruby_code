require '../utils/rspec_utils'
require '../code/doc3'

require 'pp'

block = lambda {
  class Document                ##(main
  
    # Lots of code omitted... 
  
    def save( path ) 
      File.open( path, 'w' ) do |f| 
        f.puts( encrypt( @title )) 
        f.puts( encrypt( @author ) ) 
        f.puts( encrypt( @content )) 
      end 
    end 
  
    if ENCRYPTION_ENABLED 
      def encrypt( string ) 
        string.tr( 'a-zA-Z', 'm-za-lM-ZA-L') 
      end 
    else 
      def encrypt( string ) 
        string 
      end 
    end 
  end                              ##main)
}

describe 'class definition' do
  it 'should be able to turn encryption off and on' do
    doc = Document.new( 'a test', 'russ', 'hello world' )
    Document.const_set( :ENCRYPTION_ENABLED, true )
    block.call
    doc.save( 'junk.txt' )
    File.read( 'junk.txt' ).should_not match( /test.*russ.*hello/m )

    Document.const_set( :ENCRYPTION_ENABLED, false )
    block.call
    doc.save( 'junk.txt' )
    File.read( 'junk.txt' ).should match( /test.*russ.*hello/m )
  end
end
