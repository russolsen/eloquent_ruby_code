
describe 'operators are methods' do
  it '+ should be a method call' do
    first = mock
    second = mock
    first.should_receive(:+).twice.with(second).and_return(:the_sum)

    sum = first + second          ##+op1
    sum.should == :the_sum

    sum = first.+(second)         ##+method1
    sum.should == :the_sum
  end

  it 'should do the methods in the right order' do
    fourth = mock
    third = mock
    second = mock
    first = mock

    third.should_receive(:-).twice.with(fourth).and_return(:aaa)
    second.should_receive(:*).twice.with(:aaa).and_return(:bbb)
    first.should_receive(:+).twice.with(:bbb).and_return(:ccc)

    result = first + second * (third - fourth) ##+op2
    result.should == :ccc

    result = first.+(second.*(third.-(fourth))) ##+method2
    result.should == :ccc
    
  end
end


