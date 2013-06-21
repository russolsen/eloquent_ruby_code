require '../utils/rspec_utils'

class Parent                               ##(main
  def self.who_am_i 
    puts "The value of self is #{self}" 
  end 
end 

class Child < Parent 
end                                        ##main)

describe Child do
  it 'should output the child class name' do
    out = output_of { Parent.who_am_i }
    out.should match(/Parent/)
    out = output_of { Child.who_am_i }
    out.should match(/Child/)
  end
end
