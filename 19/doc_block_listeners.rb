require '../code/doc3'

class Document             ##(main

  # Most of the class omitted...

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
end                         ##main)
