require '../utils/rspec_utils'
require 'pp'

describe 'class definition' do
  it 'should define methods one at a time' do
    out = output_of {
      class TheSameMethodTwice             ##(main
      
        def do_something 
          puts "first version" 
        end 
      
        # In between method definitions 
      
        def do_something 
          puts "second version" 
        end 
      end
      
      twice = TheSameMethodTwice.new
      twice.do_something                  ##main)
    }
    out.should match(/second version/)
    File.write( 'second.txt', out )
  end

end
