require '../code/doc3'
require '../utils/rspec_utils'


class DocumentSaveListener                ##(listeners
  def on_save( doc, path)
    puts "Hey, I've been saved!"
  end
end

class DocumentLoadListener
  def on_load( doc, path)
    puts "Hey I've been loaded!"
  end
end                                      ##listeners)

class Document                           ##(doc

  attr_accessor :load_listener
  attr_accessor :save_listener

  # Most of the class omitted...

  def load( path )
    @content = File.read( path )
    load_listener.on_load( self, path ) if load_listener
  end

  def save( path )
    File.open( path, 'w') { |f| f.print( @contents ) }
    save_listener.on_save( self, path ) if save_listener
  end
end                                     ##doc)

describe Document do
  it 'should comment on what is going on' do
    doc = Document.new( 'Example', 'Russ', 'It was a dark...' )  ##(setup
    doc.load_listener = DocumentLoadListener.new
    doc.save_listener = DocumentSaveListener.new
                                                                 ##setup)

    out = output_of { 
      doc.load( 'example.txt' )              ##(use
      doc.save( 'example.txt' )              ##use)
    }

    out.should match( /Hey.*loaded.*Hey.*saved/m )
    File.write( 'saveload.txt', out )

  end
end

