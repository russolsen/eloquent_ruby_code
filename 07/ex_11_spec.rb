require '../code/document.rb'
require '../utils/rspec_utils'

class Person                                ##(person
  attr_accessor :salary  # A method call
  attr_reader :name      # Another method call
  attr_writer :password  # And another
end                                          ##person)


describe 'chapter' do
  it 'should have good examples of suprising methods' do
    require 'date'    # A Call to a method    ##+req_date
  end

  it 'should have a working person class' do
    p = Person.new
    p.salary = 100
    p.name.should == nil
    p.password = 'xyzzy'
  end
end
