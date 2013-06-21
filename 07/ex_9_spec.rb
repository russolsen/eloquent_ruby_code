require '../code/document.rb'
require '../utils/rspec_utils'

class Document                      ##(main
  # Most of the class omitted

  def word_count
    return words.size
  end

  private :word_count
end                                ##main)


describe 'chapter' do
  it 'should have a good default private example' do
    Document.private_instance_methods.should include(:word_count)
  end

  it 'should blow up if you call word count' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...' )
    lambda {
      n = doc.word_count             ##+call_count
    }.should raise_error
  end
end
