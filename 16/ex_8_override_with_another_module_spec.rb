require '../code/doc3'
require 'writing_quality_mixin'


module PoliticalWritingQuality                ##(pwq
  # No phrase is too worn out to be a cliché
  # in political writing
  def number_of_cliches
    0
  end
end                                          ##pwq)

class Document
  include WritingQuality 

  # Rest of the class omitted...
end

class PoliticalBook < Document              ##(pb
  include WritingQuality 
  include PoliticalWritingQuality

  # Lots of stuff omitted...
end                                          ##pb)

describe PoliticalBook do
  it 'should always report zero cliches' do
    text = "my way or the highway does the trick"
    pb = PoliticalBook.new( 'speech', 'russ', text)
    pb.number_of_cliches.should == 0
    doc = Document.new( 'speech', 'russ', text)
    doc.number_of_cliches.should == 2
  end
end
