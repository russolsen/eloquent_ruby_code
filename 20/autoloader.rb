
class Object
  def self.const_missing( name )
    file_name = "#{name.to_s.downcase}"
    require file_name
    raise "Undefined constant: #{name}" unless const_defined?(name)
    const_get(name)
  end
end
