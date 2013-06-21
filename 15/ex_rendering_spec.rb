require 'ex_rendering'

describe Rendering do

  it "should have constants" do
    Rendering::DEFAULT_FONT.name.should == 'default'
    Rendering::DEFAULT_PAPER_SIZE.name.should == 'US Let'
  end

end

describe Rendering::Font do

  it "should have a one arg constructor" do
    font = Rendering::Font.new( 'times' )
    font.should be_an_instance_of( Rendering::Font )
    font.name.should == 'times'
    font.weight.should == :normal
    font.size.should == 10
  end

  it "should have a 3 arg constructor" do
    font = Rendering::Font.new( 'times', :bold, 22 )
    font.should be_an_instance_of( Rendering::Font )
    font.name.should == 'times'
    font.weight.should == :bold
    font.size.should == 22
  end

end

describe Rendering::PaperSize do

  it "should have a no arg constructor" do
    font = Rendering::PaperSize.new
    font.should be_an_instance_of( Rendering::PaperSize )
    font.name.should == 'US Let'
    font.width.should == 8.5
    font.height.should == 11.0
  end

  it "should have a 3 arg constructor" do
    font = Rendering::PaperSize.new('3x5 card', 5, 3 )
    font.should be_an_instance_of( Rendering::PaperSize )
    font.name.should == '3x5 card'
    font.width.should == 5
    font.height.should == 3
  end

end
