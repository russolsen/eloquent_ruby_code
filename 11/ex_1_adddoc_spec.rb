require '../code/doc3'
require '../utils/rspec_utils'
require 'pp'

require 'doc_plus.rb'

describe Document do
  it "should be able to add" do

    out = output_of {
    doc1 = Document.new('Tag Line1', 'Kirk', "These are the voyages") ##(ex
    doc2 = Document.new('Tag Line2', 'Kirk', "of the star ship ...")

    total_document = doc1 + doc2
    puts total_document.content   ##ex)
    }
    out.should match(/These.*star ship*/)
    File.write( 'total.txt', out)
    
  end
end
