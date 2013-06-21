require '../code/doc3'
require '../utils/rspec_utils'

class Document                        ##(enum
  include Enumerable

  # Most of the class omitted...

  def each
    words.each { |word| yield( word ) }
  end
end                                   ##enum)

class Document

  def each_word_pair                                   ##(pair
    words.each_cons(2) {|array| yield array[0], array[1] }
  end                                                  ##pair)
end

describe Document do
  it 'should have include? method' do
    doc = Document.new('Advice', 'Harry', 'Go ahead make my day')  ##+harry
    doc.include?('make').should == true
    doc.include?('donuts').should == false
  end

  it 'should have a to_a method' do
    doc = Document.new('Advice', 'Harry', 'Go ahead make my day')
    doc.to_a.should == %w{ Go ahead make my day }
  end

  it 'should have a find_all method' do
    doc = Document.new('Advice', 'Harry', 'Go ahead make my day')
    a = 
      doc.find_all { |word| word.size > 4 }               ##+bigger4
    a.should ==[ 'ahead' ]
  end

  it 'should have a each_cons method' do
    doc = Document.new('Advice', 'Harry', 'Go ahead make my day')
    out = output_of {
      doc.each_word_pair { |a, b| puts "#{a} #{b}" }
    }
    out.should match( /Go ahead.ahead make.make my.my day/m )
  end
end
