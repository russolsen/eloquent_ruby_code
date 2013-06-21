
require 'trouble_mod_good'

describe WordProcessor do

  it "should have points conversion methods" do
    WordProcessor.points_to_inches( 72.0 ).should == 1.0
  end
end
