require '../code/doc3'
require 'electronic_text'
require 'writing_quality_mixin'

class Document                      ##(wq_mixin_classes
  include WritingQuality 

  # Lots of stuff omitted...
end

class ElectronicBook < ElectronicText
  include WritingQuality 

  # Lots of stuff omitted...
end                                  ##wq_mixin_classes)

require 'prose_quality_examples'

describe 'Document and ebook' do
  it 'should have working examples' do
    text = "my way or the highway does the trick"      ##(doc_demo
    my_tome = Document.new('Hackneyed', 'Russ', text)
    puts my_tome.number_of_cliches                     ##doc_demo)

    my_ebook = ElectronicBook.new( 'EHackneyed', 'Russ', text)   ##(ebook_demo
    puts my_ebook.number_of_cliches                    ##ebook_demo)

    my_tome.number_of_cliches.should == 2
    my_ebook.number_of_cliches.should == 2
  end
end


