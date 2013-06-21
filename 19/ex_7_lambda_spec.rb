require '../utils/rspec_utils'

class Document
  def on_save( &block )
    @save_listener = block
  end

  def on_load( &block )
    @load_listener = block
  end

  def load( path )
    @content = File.read( path )
    @load_listener.call( self, path ) if @load_listener
  end

  def save( path )
    File.open( path, 'w' ) { |f| f.print( @contents ) }
    @save_listener.call( self, path ) if @save_listener
  end


  # Rest of the class omitted...
end      

class Document                                                   ##(main
  DEFAULT_LOAD_LISTENER = lambda do |doc, path|
    puts "Loaded: #{path}" 
  end

  DEFAULT_SAVE_LISTENER = lambda do |doc, path| 
    puts "Saved: #{path}" 
  end 

  attr_accessor :title, :author, :content

  def initialize( title, author, content='' )
    @title = title
    @author = author
    @content = content
    @save_listener = DEFAULT_SAVE_LISTENER
    @load_listener = DEFAULT_LOAD_LISTENER
  end

  # Rest of the class omitted...
end                                                    ##main)

describe Document do
  it 'should comment on what is going on' do
    my_doc = Document.new( 'Block Based Example', 'russ' )

    save_out = output_of { my_doc.save("example.txt") }
    load_out = output_of { my_doc.load("example.txt") }

    puts save_out
    puts load_out
    save_out.should match(/Saved: example/m)
    load_out.should match(/Loaded: example/m)
  end
end
