describe 'mocking with rspec' do
  before :each do
    @doc = mock
    @doc.should_receive(:check_spelling).and_return('correct')
  end

  it 'should know how to print itself' do                      ##(main
    mock_printer = mock('Printer') 
    mock_printer.should_receive(:available?).and_return(true) 
    mock_printer.should_receive(:render).exactly(3).times
    @doc.check_spelling( mock_printer ).should == 'correct'    ##main)

    @doc = mock
    mock_printer.available?.should == true
    3.times { mock_printer.render }
  end                                                          ##+main
end

