require 'pp'

class DisArray                               ##(main
  
  attr_reader :my_array

  def initialize
    @my_array = []
  end

  def ==(other)
    return false unless other.kind_of?(DisArray)
    @my_array == other.my_array
  end

  def eql?(other)
    return false unless other.kind_of?(DisArray)
    @my_array.eql?( other.my_array )
  end

  def hash
    @my_array.hash
  end

  # Rest of the class omitted...
end                                        ##main)


describe DisArray do
  before :each do
    @da = DisArray.new
  end

  it 'should have a good == method' do
    @da.should == @da
    (@da == DisArray.new).should == true
  end

  it 'should work in a hash' do
    hash = {}
    hash[@da] = 1
    hash[@da].should == 1
    hash[DisArray.new].should == 1
    hash[:whatever].should == nil
  end
end
