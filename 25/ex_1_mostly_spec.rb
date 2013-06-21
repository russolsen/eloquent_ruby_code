require '../utils/rspec_utils'

describe 'class definition' do
  it 'should execute code inside of class statement' do
    out = output_of {
      class MostlyEmpty                           ##(hello_inside
        puts "hello from inside the class" 
      end                                         ##hello_inside)
    }
    out.should match(/hello from/)
    File.write( 'hello.txt', out )
  end

  it 'should make self the class inside of the def' do
    out = output_of {
      class MostlyEmpty                           ##(self_inside
        puts "The value of self is #{self}" 
      end                                         ##self_inside)
    }
    out.should match(/The value.*MostlyEmpty/)
    File.write( 'self.txt', out )
  end

end
