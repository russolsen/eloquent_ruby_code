require '../code/document.rb'
require '../utils/rspec_utils'

class Document                     ##(main
  # Mostly omitted...

  def to_s
    "#{title} by #{aothor}"    # oops!
  end
end                                 ##main)

describe 'chapter' do
  it 'should have a good example of a bad to_s' do
    lambda {
       doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...' )
       doc.to_s
    }.should raise_error
  end
end
