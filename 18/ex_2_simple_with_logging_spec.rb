require 'doc_with_load_save'


class SomeApplication                    ##(main

  def initialize( logger )
    @logger = logger
  end

  def do_something
    @logger.debug( 'Starting Document load' )
    doc = Document.load( 'resume.txt' )
    @logger.debug( 'Completed Document load' )

    # Do something interesting with the document.

    @logger.debug( 'Starting Document save' )
    doc.save
    @logger.debug( 'Completed Document save' )
  end
end                                      ##main)

describe SomeApplication do

  before :each do
    Document.load_fail = Document.save_fail = false
  end

  it 'should work' do
    logger = mock
    logger.should_receive( :debug ).exactly(4).times
    SomeApplication.new( logger ).do_something
  end
end
