require 'doc_with_load_save'


class SomeApplication

  # Rest of the class omitted...

  def with_logging(description)                         ##(main
    begin
      @logger.debug( "Starting #{description}" )
      return_value = yield
      @logger.debug( "Completed #{description}" )
      return_value
    rescue
      @logger.error( "#{description} failed!!")
      raise
    end
  end                                                  ##main)
end

class SomeApplication
  def initialize( logger )
    @logger = logger
  end
end


describe SomeApplication do
  it "should have a working silly method" do
    logger = mock
    logger.should_receive(:debug).exactly(2).times
    SomeApplication.new(logger).with_logging('42') { 42 }.should == 42
  end
end
