
describe 'constant examples' do
  it 'should work' do
    FurlongsPerFortnight = 0.0001663       ##+camel
    ANTLERS_PER_MALE_MOOSE = 2             ##+worm

    defined?(FurlongsPerFortnight).should == 'constant'
    defined?(ANTLERS_PER_MALE_MOOSE).should == 'constant'
  end
end
