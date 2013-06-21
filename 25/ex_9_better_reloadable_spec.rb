require '../code/doc3'
require '../utils/rspec_utils'
require 'fileutils'
require 'pp'

describe Document do
  it 'should have a reload method' do
    FileUtils.cp 'reloadable_document2.rb', 'foo.rb'
    load 'foo.rb'
    d = Document.new( '', '', '' )
    d.doit.should == 111

    code = File.read('foo.rb')
    code.sub!('111','222')
    code.sub!( 'doit', 'zzz' )

    File.write( 'foo.rb', code )
    Document.reload
    d.zzz.should == 222
    Document.instance_methods.should_not include(:doit)
  end
end


