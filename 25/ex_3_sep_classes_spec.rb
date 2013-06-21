require '../utils/rspec_utils'
require 'pp'

describe 'class definition' do
  it 'should define methods one at a time' do
    out = output_of {
      class TheSameMethodTwice         ##(main
        def do_something 
          puts "first version" 
        end 
      end
      
      class TheSameMethodTwice 
        def do_something 
          puts "second version" 
        end
      end                             ##main)

      smt = TheSameMethodTwice.new
      smt.do_something
    }
    out.should match(/second version/)
  end

end
