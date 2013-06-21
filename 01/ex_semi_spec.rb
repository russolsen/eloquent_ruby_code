require '../utils/rspec_utils'
require '../code/doc3'


describe 'using semicolons' do

  it 'should let you stack statements' do
    doc = Document.new( 'title', 'russ', '')

    out = output_of {
      puts doc.title; puts doc.author        ##+two_puts
    }
    out.should match( /title.*russ/m )
  end

  it 'should let you define a one line class' do
    class DocumentException < Exception; end  ##+doc_exception
    DocumentException.instance_of?(Class).should == true
  end

  it 'should let you define a method in one line' do
    def method_to_be_overriden; end           ##+one_line_method
    method_to_be_overriden
  end

end
