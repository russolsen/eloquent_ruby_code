
require 'wp_points'

describe WordProcessor do

  it "should have points conversion methods" do
    WordProcessor.points_to_inches( 72.0 ).should == 1.0
    WordProcessor.points_to_inches( 720.0 ).should == 10.0
    an_inch_full_of_points = WordProcessor.inches_to_points( 1.0 )   ##+main
    an_inch_full_of_points.should == 72.0
  end
end
