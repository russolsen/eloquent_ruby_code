require 'structured_document'

class Instructions < StructuredDocument               ##(main
  def introduction( text ) 
    paragraph = Paragraph.new( :mono, 14, :none, text ) 
    self << paragraph 
  end 

  def warning( text ) 
    paragraph = Paragraph.new( :arial, 22, :bold, text ) 
    self << paragraph 
  end 

  def step( text ) 
    paragraph = Paragraph.new( :nimbus, 14, :none, text ) 
    self << paragraph   
  end 

  # and so on 
end                                                   ##main)

describe Instructions do
  it 'should have the proper methods' do
    how_to = Instructions.new( 'russ', 'resume') do |i| 
      i.introduction( 'How you do it' ) 
      i.warning( 'dont hit your head' ) 
      i.step( '1 - take a breath' ) 
      i.step( '2 - just do it' )

      # Etc...
    end
    how_to.paragraphs.first.text.should == 'How you do it'
    how_to.paragraphs.first.font_name.should == :mono
    how_to.paragraphs.first.font_size.should == 14
    how_to.paragraphs.first.font_emphasis.should == :none

    how_to.paragraphs[1].text.should match(/dont hit/)
    how_to.paragraphs[2].text.should match(/take a b/)
    how_to.paragraphs.last.text.should match(/just do it/)
    how_to.content.should match(/How.*hit your.*1.*2/m)
  end 

  it 'should have a good instructions example' do
    omlette_howto = Instructions.new( 'Russ', 'Omlettes' )  do |i|  ##(omlette
      i.warning( "Careful of those sharp egg shells!")
    end                                                             ##omlette)
  end
end 
