require '../utils/rspec_utils'

class RepeatBackToMe                           ##(main
  def method_missing( method_name, *args ) 
    puts "Hey, you just called the #{method_name} method" 
    puts "With these arguments: #{args.join(' ')}" 
    puts "But there ain't no such method"
  end 
end                                           ##main)


describe RepeatBackToMe do

  it 'should output the method' do
    out = output_of {
      repeat = RepeatBackToMe.new             ##(example
      repeat.hello( 1, 2, 3 )
      repeat.good_bye( "for", "now" )         ##example)
    }

    out.should match( /^Hey.*hello method.*1 2 3.*good_by.*now$/m )
    File.write( 'repeat.txt', out )
  end
 

end
