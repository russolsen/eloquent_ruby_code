require '../utils/rspec_utils'
require 'pp'

describe 'class definition' do
  it 'should define methods one at a time' do
    out = output_of {
      class LessEmpty                 ##(main
        pp instance_methods(false)
      
        def do_something 
          puts "I'm doing something!" 
        end 

        pp instance_methods(false)
      end                            ##main)
    }
    out.should match(/\[\]\n\[:do_something\]/)
    File.write( 'lessempty.txt', out )
  end

end
