
require '../code/document.rb'

class Document                      ##(main

  # Most of the class omitted...

  # A method

  def words
    @content.split
  end

  # And another one

  def word_count
    words.size
  end
end                               ##main)

describe 'chapter' do
  it 'should have a good document example' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...' ) ##+make_doc
    doc.words.should == %w{ By that which is... }
    (
      doc.word_count               ##+get_word_count
    ).should == 4
  end
end
