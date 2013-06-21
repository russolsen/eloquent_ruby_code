
require '../code/doc3'
require '../utils/rspec_utils'


describe 'stub examples' do

  it 'should have a good example of rspec stubs' do
    stub_printer = stub :available? => true, :render => nil  ##+basic_stub
    stub_printer.available?  # Always returns true  ##(use_stub
    stub_printer.render      # Always returns nil   ##use_stub)

    stub_printer.available?.should == true
    stub_printer.render.should == nil

    stub_font = stub :size => 14, :name => 'Courier'   ##+basic_font

    puts stub_printer.class    ##(print_classes
    puts stub_font.class       ##print_classes)

    stub_printer.class.should == RSpec::Mocks::Mock 
    stub_font.class.should == RSpec::Mocks::Mock 
  end


  it 'should be a good example of a hand build stub' do

    hand_built_stub_printer = Object.new     ##(hand_built

    def hand_built_stub_printer.available? 
      true
    end

    def hand_built_stub_printer.render
      nil
    end                                      ##hand_built)

    hand_built_stub_printer.available?.should == true
    hand_built_stub_printer.render.should == nil
  end

  it 'should be a good example of a singleton method that takes params' do
    hand_built_stub_printer = Object.new

    def hand_built_stub_printer.render( draft_quality, &block ) ##(params
      # Do something clever with the arguments...
    end                                                         ##params)

    hand_built_stub_printer.render( :draft ) { }
  end

  it 'should have an amusing example of overriding the method' do

    out = output_of {
      uncooperative = "Don't ask my class"              ##(uncoop

      def uncooperative.class
        "I'm not telling"
      end

      puts uncooperative.class                          ##uncoop)
    }

    out.should match( /I'm not telling/ )
    File.write( 'telling.txt', out )
  end

  it 'should illustrate the alternative syntax' do

    hand_built_stub_printer = Object.new          ##(alt_syn

    class << hand_built_stub_printer
      def available? 
        true
      end

      def render
        nil
      end
    end                                          ##alt_syn)

    hand_built_stub_printer.available?.should == true
    hand_built_stub_printer.render.should == nil
  end

  it 'should demo getting the singleton class' do

    hand_built_stub_printer = Object.new

    singleton_class = class << hand_built_stub_printer  ##(get_s_class
      self 
    end                                                 ##get_s_class)
  end


  it 'should demo the explain method' do

    my_object = Document.new('War and Peace', 'Tolstoy',  ##(class1
                             'All happy families...') 

    def my_object.explain 
      puts "self is #{self}" 
      puts "and its class is #{self.class}" 
    end 

    my_object.explain                                     ##class1)

    my_object = Document                                 ##(class2

    def my_object.explain 
      puts "self is #{self}" 
      puts "and its class is #{self.class}" 
    end 

    my_object.explain                                    ##class2)
  end 

  it 'should show the alternate way of doing a class method' do
    def Document.explain                                ##(class3
      puts "self is #{self}" 
      puts "and its class is #{self.class}" 
    end                                                 ##class3)
    
    Document.explain
  end 
end
