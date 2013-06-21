require '../utils/rspec_utils'
require '../code/doc3'

describe 'staying out of trouble examples' do

  it 'should see 0 as true' do
    out = output_of {
      puts 'Sorry Dennis Ritchie, but 0 is true!' if 0   ##+zero_true
    }
    out.should match( /Dennis/ )
  end

  it 'should see "false" as true' do
    out = output_of {
      puts 'Sorry but "false" is not false' if 'false'   ##+string_true
    }
    out.should match( /Sorry/ )
  end

  it 'should see true as true' do
    block = lambda do |flag|
      if flag == true            ##(flag_test
        # do something
        'yes'                    ##--flag_test
      end                        ##flag_test)
    end

    block.call( true ).should == 'yes'
    block.call( false ).should == nil
    block.call( 1 ).should == nil
    block.call( Object ).should == nil
  end

  it 'should have a correct next_object example' do
    self.should_receive(:get_next_object).and_return( 1, 2, false )

    # Broken in a subtle way...                      ##(bool_check
    while next_object = get_next_object
      # Do something with the object
    end                                              ##bool_check)
  end

  it 'should have a correct checking for nil with ==' do
    self.should_receive(:get_next_object).and_return( 1, 2, false, 88, nil )

    until (next_object = get_next_object) == nil        ##(nil_eq_check
      # Do something with the object
    end                                                 ##nil_eq_check)

  end

  it 'should have a correct next_object example' do
    self.should_receive(:get_next_object).and_return( 1, 2, false, 88, nil )

    until (next_object = get_next_object).nil?   ##(nil_check
      # Do something with the object
    end                                          ##nil_check)
  end

  it 'should have a good example of defined?' do
    doc = Document.new( 'A Question', 'Shakespeare', 'To be...' ) ##(defined
    flag = defined?( doc )                                        ##defined)

    flag.should == "local-variable"
    defined?(sjsjssjsjs).should == nil
  end

  it 'should have a good demo of the hard way of detecting a class' do
    block = lambda do |the_object|
      if the_object.nil?                           ##(check_hard
        puts 'The object is nil'
      elsif the_object.instance_of?( Numeric )
        puts 'The object is a number'
      else
        puts "The object is an instance of #{the_object.class}"
      end                                          ##check_hard)

      out = output_of { block.call( nil ) }
      out.should ==  "The obj is nil" 

      out = output_of { block.call( 33 ) }
      out.should ==  "The obj is Numeric" 

      out = output_of { block.call( String ) }
      out.should ==  "The obj is.*instanc.*Class" 
    end
  end

  it 'should have a good demo of the easy way of detecting a class' do
    the_object = nil
    out = output_of {
      puts "The object is an instance of #{the_object.class}"  ##+check_easy
    }
    out.should match( /The object.*NilClass/ )
  end
end
