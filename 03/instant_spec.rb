require '../utils/rspec_utils'
require '../code/doc3'

def load_font( name, size = 12 )                   ##(def_args
  # Go font hunting...
  [ name, size ]                                  ##--def_args
end                                                ##def_args)

def echo_all( *args )                  ##(echo_all
  args.each { |arg| puts arg }
end                                    ##echo_all)

def echo_at_least_two( first_arg, *middle_args, last_arg ) ##(least_2
  puts "The first argument is #{first_arg}"
  middle_args.each { |arg|puts "A middle argument is #{arg}" }
  puts "The last argument is #{last_arg}"
end                                                        ##least_2)

describe 'the instant hash and arrays examples in the book' do

  it 'should have a good example of how default arguments work' do
    load_font( 'ff', 42 ).should == [ 'ff', 42 ]
    load_font( 'ff' ).should == [ 'ff', 12 ]
  end

  it 'should have a working echo all method' do
    out = output_of { echo_all( 'hello', 'out', 'there' ) }
    out.should match( /hello.*out.*there/m )
  end

  it 'should have a working echo_at_least_two method' do
    out = output_of { echo_at_least_two( 1, 2 ) }
    out.should match( /is 1.*last.*2/m )

    out = output_of { echo_at_least_two( 1, 2, 3 ) }
    out.should match( /is 1.*middle.*2.*last.*3/m )

    out = output_of { echo_at_least_two( 1, 2, 3, 4 ) }
    out.should match( /is 1.*middle.*2.*middle.*3.*last.*4/m )
  end

end
