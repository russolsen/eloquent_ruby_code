require '../code/document.rb'
require '../utils/rspec_utils'

describe 'chapter' do
  it 'should have a good default to_s example' do 
    out = output_of {
      doc = Document.new( 'Emma', 'Austin', 'Emma Woodhouse, ...' )    ##(default_to_s
      puts doc                                                         ##default_to_s)
    }
    out.should match( /<Document:.*/ )
    File.write( 'def_to_s.txt', out )
  end
end
