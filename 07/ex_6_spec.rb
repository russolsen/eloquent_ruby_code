require '../code/document.rb'
require '../utils/rspec_utils'

class Document                      ##(main
  # Mostly omitted...

  def to_s
    "Document: #{title} by #{author}"
  end
end                                 ##main)

describe 'chapter' do
  it 'should have a good custom to_s example' do 
    out = output_of {
      doc = Document.new( 'Emma', 'Austin', 'Emma Woodhouse, ...' )    ##(default_to_s
      puts doc                                                         ##default_to_s)
    }
    out.should match( /Document: Emma by Austin/ )
    File.write( 'custom_to_s.txt', out )
  end
end
