

class Object
  def self.simple_attr_reader(name)
    code = "def #{name}; @#{name}; end"
    class_eval( code )
  end
end

class Object
  def self.simple_attr_writer(name)
    method_name = "#{name}="
    define_method( method_name ) do |value|
      variable_name = "@#{name}"
      instance_variable_set( variable_name, value )
    end
  end
end

class Example
  simple_attr_reader :color
  simple_attr_writer :color

  def initialize( color )
    @color = color
  end
end

e = Example.new( 'green' )
puts e.color
e.color = 'red'
puts e.color
