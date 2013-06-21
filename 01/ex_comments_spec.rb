# Author: Russ Olsen                      ##(background
# Copyright 2010 Russ Olsen 
# 
# Document: An example Ruby class         ##background)


# Class that models a plain text document, complete with title ##(with_example
# and author:
#
# doc = Document.new( 'Hamlet', 'Shakespeare', 'To be or...' )
# puts doc.title
# puts doc.author
# puts doc.content
#
# Document instances know how to parse their content into words:
#
# puts doc.words
# puts doc.word_count
#
class Document
  # class omitted...
end                                                          ##with_example)



  # Using ngram analysis, compute the probability     ##(explain
  # that this document and the one passed in were
  # written by the same person. This algorithm is
  # known to be valid for American English and will
  # probably work for British and Canadian English.
  #
  def same_author_probability( other_document )
    # Implementation left as an exercise for the reader...
  end                                                 ##explain)

describe 'comments examples' do
  it 'how to example should just work' do
    same_author_probability( 9999 )
  end

  it 'should also explain good one liners' do
    divisor = 0

    block = lambda {
      return 0 if divisor == 0   # Avoid division by zero      ##+good_one
    }
    
    block.call.should == 0
  end

  it 'should explain bad one liners' do
    count = 88
    count += 1  # Add one to count             ##+bad_one
    count.should == 89
  end
end
