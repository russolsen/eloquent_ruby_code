
class SomeApplication
  def log_before( description )                  ##(before
    @logger.debug( "Starting #{description}" )
    yield
  end                                           ##before)


  def log_after( description )                  ##(after
    yield
    @logger.debug( "Done #{description}" )
  end                                           ##after)
end

class SomeApplication
  def initialize( logger )
    @logger = logger
  end
end

describe SomeApplication do

  it 'should have a propert log_before' do
    logger = mock
    logger.should_receive(:debug).exactly(1).times
    SomeApplication.new(logger).log_before('test') {}
  end

  it 'should have a propert log_after' do
    logger = mock
    logger.should_receive(:debug).exactly(1).times
    SomeApplication.new(logger).log_after('test') {}
  end

end
