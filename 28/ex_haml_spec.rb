require 'haml'
require '../utils/rspec_utils'

describe 'converting haml' do
  it 'should work as described in book' do
    template = File.read('example.haml')
    haml_engine = Haml::Engine.new(template)
    out = haml_engine.render
    out.should match( /<html>.*<\/html>/m )
    out.should match( /<body>.*<\/body>/m )
    out.should match( /Today is/m )
    File.write( 'example.html', out )
  end
end
