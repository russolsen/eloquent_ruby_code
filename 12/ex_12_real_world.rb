require '../utils/rspec_utils'

class RomanNumerals            ##(roman
  include Comparable
  
  def initialize(x); @x = x; end   ##--roman

  # Actual guts of the class omitted...

  def <=>(other)
    # Return -1, 0, or 1...
    @x <=> other               ##--roman
  end
end                            ##roman)


describe 'real world equality' do

  it 'should be that 1 == 1.0' do
    output_of {
      puts 1 == 1.0     # A Fixnum and a Float  ##+int_float
    }.should == "true\n"
  end

  it 'should be correct about <=>' do
    ( 1 <=> 2 ).should == -1
    ( 1 <=> 1 ).should == 0
    ( 2 <=> 1 ).should == 1
  end
end

describe RomanNumerals do
  it 'should have all the relops' do
    a1 = RomanNumerals.new( 1 )
    a2 = RomanNumerals.new( 1 )
    b = RomanNumerals.new( 2 )

    (a1 == a2).should == true
    (a1 < b).should == true
    (a1 > b).should == false
    (a1 == b).should == false
    (a1 <=> b).should == -1
  end
end

describe 'Case and classes' do
  it 'should work with classes' do

    result = ''
    the_object = 3.14159               ##(case

    case the_object 
    when String 
     puts "it's a string" 
     
    when Float 
     puts "It's a float" 
     result = 'FLOAT'                 ##--case
    
    when Fixnum 
     puts "It's a fixnum" 

    else 
     puts "Dunno!" 
    end                               ##case)

    result.should == 'FLOAT'
  end
end
