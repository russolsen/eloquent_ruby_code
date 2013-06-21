
require '../utils/rspec_utils'


def do_something              ##(do_something_if
  yield if block_given?
end                           ##do_something_if)


def do_something_with_an_arg   ##(do_something_arg
  yield("Hello World") if block_given?
end
                               ##do_something_arg)


def print_the_value_returned_by_the_block  ##(print_def
  if block_given?
    value = yield
    puts "The block returned #{value}"
  end
end
                                           ##print_def)

describe 'the basic block examples' do
  it 'should have a good example with braces' do
    out = output_of {
      do_something { puts "Hello from inside the block" } ##+braces
    }
    out.should match(/Hello.*block/)
  end

  it 'should have a good do/end example' do
    out = output_of {
      do_something do                             ##(doend
        puts "Hello from inside the block"
      end                                         ##doend)
    }
    out.should match(/Hello.*block/)
  end

  it 'should have a good example with an arg' do
    out = output_of {
      do_something_with_an_arg do |message|     ##(do_something_arg_use
        puts "The message is #{message}"
      end                                      ##do_something_arg_use)
    }
    out.should == "The message is Hello World\n"
    File.write( 'with_arg.txt', out )
  end

  it 'should have a good example of a return val from a block' do
    out = output_of {
      print_the_value_returned_by_the_block { 3.14159 / 4.0 }  ##+print_use
    }
    out.should == "The block returned 0.7853975\n"
    File.write( 'pi4.txt', out )
  end
end
