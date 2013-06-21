require '../utils/rspec_utils'
require 'ex_case'

describe "The example case statements" do
  it "should produce the right output with semicolons" do
    (output_of { case_semi( 'War And Peace' ) }).should == "Tolstoy\n" 
    (output_of { case_semi( 'Romeo And Juliet' ) }).should == "Shakespeare\n"
    (output_of { case_semi( 'Whatever' ) }).should == "Don't know\n" 
  end

  it "should produce the right output with semicolons" do
    (output_of { case_no_semi( 'War And Peace' ) }).should == "Tolstoy\n" 
    (output_of { case_no_semi( 'Romeo And Juliet' ) }).should == "Shakespeare\n"
    (output_of { case_no_semi( 'Whatever' ) }).should == "Don't know\n" 
  end

end
