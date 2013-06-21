

describe Regexp do

  it 'should support =~ as matching and == as equality' do
    (
      /Roswell.*/ =~ 'Roswell' # Yes!  ##+main
    ).should_not == nil 

    (
      /Roswell.*/ == 'Roswell' # No!  ##+main
    ).should == false  # No!
  end

  it 'should work in a case statement' do
    result = ''
    location = 'area 51'        ##(case

    case location 
    when /area.*/ 
      # ... 
      result = 'A51'            ##--case
    when /roswell.*/ 
      # ... 
    else 
      # ... 
    end                         ##case)

    result.should == 'A51'
  end

end

