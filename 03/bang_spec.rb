require '../utils/rspec_utils'

describe 'the bang examples in the book' do

  it 'should have a good example of reverse and reverse!' do
    a = [ 1, 2, 3]                 ##(no_change
    a.reverse                      ##no_change)

    a.should == [ 1, 2, 3 ]

    out = output_of {
      pp a.reverse                   ##(print_both
      pp a                           ##print_both)
    }

    out.should match( /3.*2.*1.*1.*2.*3/m )

    File.write( 'reverse.txt', out )

    out = output_of {
      a.reverse!                    ##(print_bang
      pp a                          ##print_bang)
    }

    out.should match( /3.*2.*1/m )

    File.write( 'bang.txt', out )
  end

end
