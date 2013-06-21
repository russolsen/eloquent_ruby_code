describe "The if expression" do 
  it "evaluates body if expression is true" do 
    a = [] 
    if true 
       a << 123 
    end 
    a.should == [123] 
  end 

  it "does not evaluate body if expression is false" do 
    a = [] 
    if false 
      a << 123 
    end 
    a.should == [] 
  end 

  # Lots and lots of stuff omitted 
end 
