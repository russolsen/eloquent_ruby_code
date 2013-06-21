require 'doc_with_load_save'


class SomeApplication                   ##(main

  # Rest of the class omitted...

  def do_something
    begin
      @logger.debug( 'Starting Document load' )
      @doc = Document.load( 'resume.txt' )
      @logger.debug( 'Completed Document load' )
    rescue
      @logger.error( 'Load failed!!' )
      raise
    end

    # Do something with the document...

    begin
      @logger.debug( 'Starting Document save' )
      @doc.save
      @logger.debug( 'Completed Document save' )
    rescue
      @logger.error( 'Save failed!!' )
      raise
    end
  end
end                                        ##main)


class SomeApplication

  def initialize( logger )
    @logger = logger
  end
end

load 'some_application_examples.rb'
