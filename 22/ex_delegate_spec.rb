require '../code/doc4'
require '../utils/rspec_utils'

require 'delegate'                   ##(main

class DocumentWrapper < SimpleDelegator 
  def initialize( real_doc ) 
    super( real_doc ) 
  end 
end                                  ##main)


describe DocumentWrapper do
  it 'should behave like the example says' do
    text =  'The Hare was once boasting of his speed...'        ##(make_it
    real_doc = Document.new( 'Hare & Tortoise', 'Aesop', text ) 

    wrapper_doc = DocumentWrapper.new( real_doc )               ##make_it)

    wrapper_doc.title.should == 'Hare & Tortoise'
    wrapper_doc.author.should == 'Aesop'
    wrapper_doc.content.should match( /The Hare was/ )

    out = output_of {
      puts wrapper_doc.title                    ##(use_it
      puts wrapper_doc.author 
      puts wrapper_doc.content                  ##use_it)
    }

    out.should match( /Hare &.*Aesop.*boasting/m )

    File.write( 'hare.txt', out )
    
  end
end
