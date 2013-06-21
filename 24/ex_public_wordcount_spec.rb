require '../code/doc4.rb'

class Document
  private :word_count 
end

class Document              ##(main
  public :word_count 
end                         ##main)

describe 'document with private word_count' do
  it 'should have a private wordcount method' do
    doc = Document.new( 'example', 'russ', 'hello world' )
    doc.word_count
  end
end
