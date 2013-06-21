require '../utils/rspec_utils'
require '../code/doc3'


class FormLetter < Document                       ##(main
 
  def replace_word( old_word, new_word ) 
    @content.gsub!( old_word, "#{new_word}" ) 
  end
 
  def replace_firstname( new_first_name ) 
    replace_word( 'FIRSTNAME', new_first_name ) 
  end 

  def replace_lastname( new_last_name ) 
    replace_word( 'LASTNAME', new_last_name )
  end 
end                                               ##main)

describe 'FormLetter with conv. methods' do
  it "should know how to replace fn and ln" do
    fl = FormLetter.new( "form", "russ", "FIRSTNAME LASTNAME" )
    fl.replace_firstname( 'Fred' )
    fl.replace_lastname( 'Flip' )
    fl.content.should == 'Fred Flip'
  end
end
