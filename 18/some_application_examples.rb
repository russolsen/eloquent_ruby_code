describe SomeApplication do

  before :each do
    Document.load_fail = Document.save_fail = false
  end

  it 'should do the proper logging when no exceptions are raised' do
    logger = mock
    logger.should_receive(:debug).exactly(4).times
    SomeApplication.new(logger).do_something
  end

  it 'should do the proper logging when the save fails' do
    logger = mock
    logger.should_receive(:debug).exactly(3).times
    logger.should_receive(:error).once
    Document.save_fail = true
    lambda { SomeApplication.new(logger).do_something }.should raise_error
  end

  it 'should do the proper logging when the load fails' do
    logger = mock
    logger.should_receive(:debug).exactly(1).times
    logger.should_receive(:error).once
    Document.load_fail = true
    lambda { SomeApplication.new(logger).do_something }.should raise_error
  end
end
