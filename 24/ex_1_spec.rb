require '../code/doc4'
require '../utils/rspec_utils'

describe 'initial examples in chapter' do
  it 'should demo simple vars correctly' do
    name = 'Issac'     ##+name1
    name = 'Asimov'    ##+name2

    name.should == 'Asimov'
  end

  it 'should demo the average_word_length method correctly' do
    cover_letter = Document.new( 'Letter', 'Russ', "Here's my resume" )   ##+cover

    avg = (
      cover_letter.average_word_length   ##+avg_word_len
    )
    (avg - 4.666667).abs.should < 0.001
  end

  it 'should demo bad things with empty docs' do
    out = output_of {
      empty_doc = Document.new( 'Empty!', 'Russ', '' )   ##(empty
      puts empty_doc.average_word_length                 ##empty)
    }
    out.should == "NaN\n"
  end
end
