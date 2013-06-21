
require 'doc_with_load_save'

class SomeApplication                      ##(main

  # Rest of the class omitted...

  def do_something
    with_logging('load', nil) { @doc = Document.load( 'book' ) }

    # Do something with the document...
    
    with_logging('save', @doc) { |the_object| the_object.save }
  end


  def with_logging(description, the_object)
    begin
      @logger.debug( "Starting #{description}" )
      yield( the_object )
      @logger.debug( "Completed #{description}" )
    rescue
      @logger.error( "#{description} failed!!")
      raise
    end
  end
end                                         ##main)


class SomeApplication
  def initialize( logger )
    @logger = logger
  end
end


load 'some_application_examples.rb'



