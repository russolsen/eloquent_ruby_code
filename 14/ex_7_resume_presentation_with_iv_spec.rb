require 'resume_presentation_with_iv'
require 'pp'

describe 'Document and subclasses NOT fighting' do

  it 'should have a good example' do
    Presentation.default_font = :courier            ##+pres_example
  end

  it 'should let you change the def fonts independly' do
    Document.default_font = :doc_font

    Presentation.default_font = :deja_vu   ##(indy
    Resume.default_font = :granada         ##indy)

    Presentation.default_font.should == :deja_vu
    Resume.default_font.should == :granada 
    Document.default_font.should == :doc_font
  end

  it 'The 3 classes have 3 different vars' do

    Document.default_font = :doc_font
    Resume.default_font = :resume_font
    Presentation.default_font = :pres_font

    Document.default_font.should == :doc_font
    Resume.default_font.should == :resume_font
    Presentation.default_font.should == :pres_font


    Resume.default_font = :resume_font1
    Presentation.default_font = :pres_font1
    Document.default_font = :doc_font1

    Document.default_font.should == :doc_font1
    Resume.default_font.should == :resume_font1
    Presentation.default_font.should == :pres_font1

  end
end
