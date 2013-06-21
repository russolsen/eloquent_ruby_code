require '../code/doc3'
require '../utils/rspec_utils'

class Document 
  def word_frequencies            ##(main
    freq = {}
    words.each do |word|
      if freq[word]
        freq[word] += 1
      else
        freq[word] = 1
      end
    end 
    freq
  end                            ##main)
end 

describe "word frequencies method" do
  it "should return the right word frequencies" do
    doc = Document.new( 'poem', '?', 'twinkle twinkle little star')
    doc.word_frequencies['twinkle'].should == 2
    doc.word_frequencies['little'].should == 1
    doc.word_frequencies['star'].should == 1
  end

  it 'should have a single arg each example' do
    out = output_of {
      doc = Document.new( 'poem', '?', 'twinkle twinkle little star')    ##(single_example
      doc.word_frequencies.each { |entry| pp entry }                           ##single_example)
    }

    out.should match( /"twinkle", 2.*"litt.*1.*"star.*1/m )
    File.write( "twinkle.txt", out )
  end

  it 'should have a double arg each example' do
    out = output_of {
      doc = Document.new( 'poem', '?', 'twinkle twinkle little star')
      doc.word_frequencies.each { |word, value| pp word, value }     ##+double_example
    }

    out.should match( /"twinkle".*2.*"litt.*1.*"star.*1/m )
  end

  it  'should have a good single arg find example' do
      doc = Document.new( 'poem', '?', 'twinkle twinkle little star')
      out =  (
        doc.words.find { |word| word.length > 3 && word[0] == 't' }         ##+single_find_example
      )
      out.should == "twinkle"
  end

  it  'should have a good double arg find example' do
      doc = Document.new( 'poem', '?', 'twinkle twinkle little star')
      out =  (
        doc.word_frequencies.find { |word, freq| freq > 1 }   ##+double_find_example
      )
      out.should == [ "twinkle", 2 ]
  end

end
