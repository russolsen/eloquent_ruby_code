describe Document do

  it 'should report 0 cliches for a doc w/o cliches' do
    d = Document.new( 'no cliche', 'russ', 'This is original' )
    d.number_of_cliches.should == 0
  end

  it 'should report 0 cliches for a empty doc' do
    d = Document.new( 'no cliche', 'russ', '' )
    d.number_of_cliches.should == 0
  end

  it 'should report 1 cliches for a doc with 1 cliches' do
    d = Document.new( 'no cliche', 'russ', 'We need to make no mistake' )
    d.number_of_cliches.should == 1
  end

  it 'should report 3 cliches for a doc with 3 cliches' do
    content = 'does the trick my way or the highway off and running'
    d = Document.new( 'no cliche', 'russ', content )
    d.number_of_cliches.should == 3
  end
end
