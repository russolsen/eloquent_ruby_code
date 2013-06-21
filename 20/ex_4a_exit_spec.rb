require '../utils/rspec_utils'


describe 'at_exit demo' do
  it 'should print the right stuff' do
    out = `ruby at_exit_demo.rb`
    out.should match( /Goodbye.*Have a/m)
    File.write( 'bye.txt', out )
  end
end
