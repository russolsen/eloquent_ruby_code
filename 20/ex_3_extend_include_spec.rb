module UsefulInstanceMethods                ##(main
  def an_instance_method 
  end 
end 

module UsefulClassMethods 
  def a_class_method 
  end 
end 

class Host 
  include UsefulInstanceMethods 
  extend UsefulClassMethods 
end                                  ##main)

describe Host do
  it 'should include UsefulInstanceMethods' do
    h = Host.new
    h.an_instance_method
  end

  it 'should have the class method' do
    Host.a_class_method
  end
end
