require '../utils/rspec_utils'
require '../code/doc3'

describe 'staying out of trouble examples' do

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
