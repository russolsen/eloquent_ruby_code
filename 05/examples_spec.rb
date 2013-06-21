require '../utils/rspec_utils'

describe "String examples" do
  it "should be correct regular expression example" do
    (/\d\d:\d\d (AM|PM)/ =~ '10:24 PM').should == 0
  end

  it "should be correct re example" do
   (/PM/ =~ '10:24 PM').should == 6
   (/May/ =~ 'Bright and early').should == nil
  end

  it "should be a good example of =~" do
  puts "It's morning!" if /AM/ =~ '10:24 AM'
  puts "It's morning!" if '10:24 AM' =~ /AM/
  end

  it "should show the case insen of i modifier" do
    (/\d\d:\d\d (AM|PM)/i =~ '12:01 am').should_not == nil
    (/\d\d:\d\d (AM|PM)/i =~ '12:01 AM').should_not == nil
  end

  it "should show gsub! working with res" do
    @content = '10:24 AM'
    def obscure_times
      @content.gsub!( /\d\d:\d\d (AM|PM)/, '**:** **' )
    end
    obscure_times
    @content.should == '**:** **'
  end

  it "should show that == does not do matching" do
    (/abc*/ == "abccccc").should == false
  end
    

end
