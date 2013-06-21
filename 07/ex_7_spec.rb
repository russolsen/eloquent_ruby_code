require '../code/document.rb'
require '../utils/rspec_utils'

describe 'chapter' do
  it 'should have a good instance_variables example' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...' )
    out = output_of { 
      pp doc.instance_variables        ##+vars
    }
    out.should match( /@title/ )
    out.should match( /@author/ )
    out.should match( /@content/ )
    puts out
    File.write( "variables.txt", out )
  end
end
