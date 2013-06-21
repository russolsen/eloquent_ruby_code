class Object                          ##(reader
  def self.simple_attr_reader(name) 
    code = "def #{name}; @#{name}; end" 
    class_eval( code ) 
  end 
end                                   ##reader)


class Object                          ##(writer
  def self.simple_attr_writer(name) 
    method_name = "#{name}=" 
     define_method( method_name ) do |value| 
      variable_name = "@#{name}" 
      instance_variable_set( variable_name, value ) 
    end 
  end 
end                                    ##writer)

class SimpleAttrTester
  simple_attr_reader :size
  simple_attr_writer :size
  simple_attr_reader :color

  def initialize( size, color)
    @size = size
    @color = color
  end
end

describe SimpleAttrTester do

  it 'should have the correct accessors' do
    methods = SimpleAttrTester.instance_methods
    methods.should include(:size)
    methods.should include(:size=)
    methods.should include(:color)
  end

  it 'should set the size attribute' do
    s = SimpleAttrTester.new( :big, :green )
    s.size.should == :big
    s.size = :small
    s.size.should == :small
  end

  it 'should get the attributes' do
    s = SimpleAttrTester.new( :big, :green )
    s.size.should == :big
    s.color.should == :green
  end
end

