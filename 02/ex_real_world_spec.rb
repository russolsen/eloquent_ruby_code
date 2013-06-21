
describe 'or equals form' do
  before :all do
    @first_name = nil
  end

  it 'should include an unless example' do
    block = lambda {
      @first_name = '' unless @first_name       ##+unless
    }

    block.call
    @first_name.should == ''

    @first_name = 'russ'
    block.call
    @first_name.should == 'russ'
  end

  it 'should include a good ||= example' do
    block = lambda {
      @first_name ||= ''                         ##+or_equals
    }

    block.call
    @first_name.should == ''

    @first_name = 'russ'
    block.call
    @first_name.should == 'russ'
  end

  it 'should include a good ||= expansion example' do
    block = lambda {
      @first_name = @first_name || ''    ##+expansion
    }

    block.call
    @first_name.should == ''

    @first_name = 'russ'
    block.call
    @first_name.should == 'russ'
  end

  it 'should include a good count increment example' do
    count = 44

    count += 1                          ##+count_plus_equals
    count.should == 45

    count = count + 1                   ##+count_plus_one
    count.should == 46
  end

end
