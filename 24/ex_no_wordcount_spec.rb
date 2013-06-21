require '../utils/rspec_utils'
require '../code/doc4.rb'

class Document                   ##(main
  remove_method :word_count 
end                              ##main)


describe 'document with private word_count' do
  it 'should have a private wordcount method' do
    doc = Document.new( 'example', 'russ', 'hello world' )
    lambda { doc.word_count }.should raise_error
  end
end
