require '../code/doc3'

class Document       ##(main
  def self.reload 
    remove_instance_methods 
    load( __FILE__ ) 
  end 

  def self.remove_instance_methods 
    instance_methods(false).each do |method|
      remove_method(method)
    end
  end 

  # Rest of the class omitted...
end                  ##main)

class Document
  def doit
    111
  end
end
