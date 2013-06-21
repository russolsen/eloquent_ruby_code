
require 'trouble_mod_bad'
include WordProcessor

describe WordProcessor do

  it "should have instance points conversion methods" do
    points_to_inches( 72.0 ).should == 1.0
  end
end
