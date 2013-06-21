
require 'document_with_cv'
require 'resume'
require 'presentation'

describe Resume do
  it 'should have its own default font' do
    Resume.default_font.should == :arial
  end

  it 'should support chaning the default font w/o messing with doc or presentation' do
    old_presentation_font = Presentation.default_font
    Resume.default_font = :something_else
    Resume.default_font.should == :something_else
    Presentation.default_font.should == old_presentation_font
    Document.class_variable_defined?(:@@default_font).should == false
  end

  it 'should not set the default font on document' do
    Document.class_variable_defined?(:@@default_font).should == false
  end

end

describe Presentation do
  it 'should have its own default font' do
    Presentation.default_font.should == :nimbus
  end

  it 'should not set the default font on document' do
    Document.class_variable_defined?(:@@default_font).should == false
  end

end
