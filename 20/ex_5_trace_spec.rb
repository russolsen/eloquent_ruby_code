require '../utils/rspec_utils'


describe 'trace demo' do
  it 'should print the right stuff' do
    out = `ruby trace_func_demo.rb`
    out.size.should > 5000
    lines = out.split("\n")
    lines = lines[0..7]
    File.write( 'trace.txt', lines.join("\n" ) )
  end
end
