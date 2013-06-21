require 'doc_with_load_save'


class SomeApplication         ##(main
  def do_something
    with_logging('load') { @doc = Document.load( 'resume.txt' ) }

    # Do something with the document...
    
    with_logging('save') { @doc.save }
  end

  # Rest of the class omitted...

  def with_logging(description)
    begin
      @logger.debug( "Starting #{description}" )
      yield
      @logger.debug( "Completed #{description}" )
    rescue
      @logger.error( "#{description} failed!!")
      raise
    end
  end
end                               ##main)


class SomeApplication             ##(silly
  def do_something_silly          ##(just_method
    with_logging( 'Compute miles in a light year' ) do 
      186000 * 60 * 60 * 24 * 365
    end
  end                            ##just_method)
end                              ##silly)

class SomeApplication

  def initialize( logger )
    @logger = logger
  end
end

load 'some_application_examples.rb'

describe SomeApplication do
  it "should have a working silly method" do
    logger = mock
    logger.should_receive(:debug).exactly(2).times
    SomeApplication.new(logger).do_something_silly
  end
end
