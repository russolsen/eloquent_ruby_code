require 'document_with_default_font'
require 'presentation'
require 'resume'

require 'pp'

describe 'Document and subclasses fighting' do

  it 'Document has the only class variable' do
    Document.class_variable_defined?(:@@default_font).should == true
    Document.default_font.should == :arial # from resume
    Resume.default_font.should == :arial
    Presentation.default_font.should == :arial

    Resume.default_font = :for_resume
    Document.default_font.should == :for_resume
    Resume.default_font.should == :for_resume
    Presentation.default_font.should == :for_resume

    Presentation.default_font = :for_pres
    Document.default_font.should == :for_pres
    Resume.default_font.should == :for_pres
    Presentation.default_font.should == :for_pres
  end
end
