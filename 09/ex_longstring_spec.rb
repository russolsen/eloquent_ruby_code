describe 'stubbing an apparently long string' do

  it 'should know how to make a string look long' do 

    apparently_long_string = 'actually short'                      ##(main
    apparently_long_string.stub!( :length ).and_return( 1000000 )  ##main)

    apparently_long_string.should ==  'actually short'
    apparently_long_string.length.should ==  1000000
  end

end
