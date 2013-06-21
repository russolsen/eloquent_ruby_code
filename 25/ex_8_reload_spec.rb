require '../code/doc3'
require '../utils/rspec_utils'
require 'fileutils'

describe Document do
  it 'should have a reload method' do
    FileUtils.cp 'reloadable_document.rb', 'foo.rb'
    load 'foo.rb'
    d = Document.new( '', '', '' )
    d.doit.should == 111
    File.write( 'foo.rb', File.read('foo.rb').sub('111','222') )
    Document.reload
    d.doit.should == 222
  end
end


