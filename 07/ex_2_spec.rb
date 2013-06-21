require '../code/doc3.rb'
require '../utils/rspec_utils'

class Document                      ##(main
  # Most of the class on holiday...

  def about_me
    puts "I am #{self}"
    puts "My title is #{self.title}"
    puts "I have #{self.word_count} words"
  end
end                               ##main)

describe 'chapter' do
  it 'should have a good about_me example' do
    doc = Document.new( 'Ethics', 'Spinoza', 'By that which is...' )
    out = output_of { doc.about_me }
    out.should match( /I am.*My title is Ethics.*4 words/m )
    File.write( "about_me.txt", out )
  end
end
