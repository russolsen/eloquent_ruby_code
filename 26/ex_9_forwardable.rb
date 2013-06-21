require '../code/doc3'
require '../utils/rspec_utils'

require 'forwardable' 

class DocumentWrapper            ##(main
  extend Forwardable 

  def_delegators  :@real_doc, :title, :author, :content 

  def initialize( real_doc ) 
    @real_doc = real_doc 
  end 
end                              ##main)



describe DocumentWrapper do
  it 'should work' do
    real_doc = wrapped_doc = nil

    out = output_of {
      real_doc = Document.new( 'Two Cities', 'Dickens', 'It was...' ) ##(ex
      wrapped_doc = DocumentWrapper.new( real_doc ) 

      puts wrapped_doc.title 
      puts wrapped_doc.author 
      puts wrapped_doc.content                                               ##ex)
    }

    out.should match(/Two.*Dickens.*Best/m)

    wrapped_doc.title.should == real_doc.title
    wrapped_doc.author.should == real_doc.author
    wrapped_doc.content.should == real_doc.content
  end
end
