require '../code/doc3'
require 'doc_each_word'

def count_till_tuesday( doc )         ##(main
  count = 0
  doc.each_word do |word|
    count += 1
    break if word == 'Tuesday'
  end
  count                               ##main)
end


describe 'each_word method with break' do

  it 'should work exit the calling method' do
    doc = Document.new( 'whatever', 'russ', 'Monday Tuesday Wed' )
    count_till_tuesday( doc ).should == 2
  end

end
