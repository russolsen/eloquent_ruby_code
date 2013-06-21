require 'structured_document'
require 'pp'

describe StructuredDocument do
  it 'should actually work' do
    russ_cv = StructuredDocument.new( 'Resume', 'RO' ) do |cv|   ##(russ_cv
      cv << Paragraph.new( :nimbus, 14, :bold, 'Russ Olsen' ) 
      cv << Paragraph.new( :nimbus, 12, :italic, '222 Rocky Way') 
      cv << Paragraph.new( :nimbus, 12, :none, 'russ@russolsen.com') 
      # .. and so on 
    end                                                              ##russ_cv)

    russ_cv.paragraphs.first.text.should == 'Russ Olsen'
    russ_cv.paragraphs.first.font_name.should == :nimbus
    russ_cv.paragraphs.first.font_size.should == 14
    russ_cv.paragraphs.first.font_emphasis.should == :bold

    russ_cv.paragraphs[1].text.should match(/222.*/)
    russ_cv.paragraphs.last.text.should match(/@russolsen.com/)
    russ_cv.content.should match(/Russ.*Rocky.*olsen.com/m)
  end
end 

