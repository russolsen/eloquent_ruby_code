require '../code/document.rb'
require '../utils/rspec_utils'

class Document                     ##(main
  # Most of the class omitted...

  def word_count
    return words.size
  end

  private :word_count

  # This method works because self is the right thing,
  # the document instance, when you call it.
  def print_word_count
    n = word_count
    puts "The number of words is #{word_count}"
  end
end                                 ##main)

# RomanceNovel is a subclass of Document,    ##(romance
# which is a subclass of Object

class RomanceNovel < Document
  def number_of_steamy_words
    word_count / 4     # Works: self is a Document instance!
  end
end                                 ##romance)

describe 'chapter' do
  it 'should have a good default private example' do
    Document.private_instance_methods.should include(:word_count)
  end

  it 'should have a working print_word_count method' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is' )
    out = output_of {
      doc.print_word_count
    }
    out.should match( /The number.*4/ )
    File.write( "print_word_count.txt", out )
  end

  it 'should have a working romance novel example' do
    rn = RomanceNovel.new( 'Love', 'Cupid', 'Roses are red violets' )
    rn.number_of_steamy_words.should == 1
  end

  it 'should have a working send example' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is' )
    n = doc.send( :word_count )   ##+send_msg
    n.should == 4
  end
end
