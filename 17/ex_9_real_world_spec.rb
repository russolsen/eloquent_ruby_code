require '../utils/rspec_utils'
require 'resolv'

describe Dir do
  it 'should run thru the files in a dir' do
    puts "Contents of /etc directory:"          ##(dir
    etc_dir = Dir.new("/etc")
    etc_dir.each {|entry| puts entry}           ##dir)
  end
end

describe Resolv do
  it 'should go thru the inet addresses' do
    out = output_of {
      Resolv.each_address( "www.google.com" ) {|a| puts a} ##+addr
    }
    File.write( 'resolv.txt', out )
  end
end

describe ObjectSpace do
  it 'should have an each_object method' do
    output_of {
      ObjectSpace.each_object(String) { |the_string| puts the_string }     ##+obj
    }
  end
end

describe 'Prime' do
  it 'should have an each method' do
    require 'mathn'
    # Warning: According to Euclid, this never stops...
    Prime.each {|x| break if x > 100 }
  end
end



