require 'structured_document'
require 'pp'


class Resume < StructuredDocument                   ##(resume
  def name( text ) 
    paragraph = Paragraph.new( :nimbus, 14, :bold, text ) 
    self << paragraph 
  end 

  def address( text ) 
    paragraph = Paragraph.new( :nimbus, 12, :italic, text ) 
    self << paragraph 
  end 

  def email( text ) 
    paragraph = Paragraph.new( :nimbus, 12, :none, text ) 
    self << paragraph 
  end 

  # and so on 
end                                                ##resume)

describe Resume do
  it 'should have the proper methods' do
    russ_cv = Resume.new( 'russ', 'resume') do |cv|  ##(russ
      cv.name( 'Russ Olsen' ) 
      cv.address( '222 Rocky Way' ) 
      cv.email( 'russ@russolsen.com' ) 

      # Etc...
    end                                                  ##russ)
    russ_cv.paragraphs.first.text.should == 'Russ Olsen'
    russ_cv.paragraphs.first.font_name.should == :nimbus
    russ_cv.paragraphs.first.font_size.should == 14
    russ_cv.paragraphs.first.font_emphasis.should == :bold

    russ_cv.paragraphs[1].text.should match(/222.*/)
    russ_cv.paragraphs.last.text.should match(/@russolsen.com/)
    russ_cv.content.should match(/Russ.*Rocky.*olsen.com/m)
  end 
end 
