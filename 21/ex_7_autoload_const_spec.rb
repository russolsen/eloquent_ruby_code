require '../utils/rspec_utils'

class AutoLoad
  def self.const_missing( name )                  ##(main
    file_name = "#{name.to_s.downcase}" 
    require file_name 
    raise "Undefined: #{name}" unless const_defined?(name) 
    const_get(name) 
  end                                             ##main)
end

describe AutoLoad do

  it 'should autoload files' do
    clazz = AutoLoad::Example
    clazz.class.should == Class
  end

  it 'should blow up on undefined files' do
    lambda { clazz = AutoLoad::FooBar }.should raise_error
  end

end
