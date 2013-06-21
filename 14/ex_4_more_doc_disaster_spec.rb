require 'document_with_default_font'
require 'resume'
require 'presentation'



describe 'Loading presentation last changes global def font' do

  it 'Document has the only class variable' do
    Document.class_variable_defined?(:@@default_font).should == true
    Document.default_font.should == :nimbus 
    Resume.default_font.should == :nimbus
    Presentation.default_font.should == :nimbus
  end
end
