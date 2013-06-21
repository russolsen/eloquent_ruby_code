

module UsefulMethods              ##(main
  module ClassMethods 
    def a_class_method 
    end 
  end 

  def self.included( host_class ) 
    host_class.extend( ClassMethods ) 
  end 

  def an_instance_method 
  end 

  # Rest of the module deleted... 
end

class Host 
  include UsefulMethods
end                                ##main)

describe Host do
  it 'should include InstanceMethods' do
    h = Host.new
    h.an_instance_method
  end

  it 'should have the class method' do
    Host.a_class_method
  end
end
