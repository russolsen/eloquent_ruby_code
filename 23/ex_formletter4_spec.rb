require '../utils/rspec_utils'
require '../code/doc3'

class FormLetter < Document 

  def replace_word( old_word, new_word ) 
    @content.gsub!( old_word, "#{new_word}" ) 
  end 

  def method_missing( name, *args ) 
    string_name = name.to_s 
    return super unless string_name =~ /^replace_\w+/ 
    old_word = extract_old_word(string_name) 
    replace_word( old_word, args.first ) 
  end 

  def extract_old_word( name ) 
    name_parts = name.split('_') 
    name_parts[1].upcase 
  end 

  def respond_to?(name)                      ##(respond_to
    string_name = name.to_s 
    return true if string_name =~ /^replace_\w+/
    super
  end                                        ##respond_to)
end

describe "version of formletter with respond_to?" do
  it "should respond to replace_*" do
    letter = FormLetter.new( 'Example', 'Acme Inc', 'The word is WORD' )
    letter.respond_to?( :replace_name ).should == true
    letter.respond_to?( :replace_foo ).should == true
    letter.respond_to?( :xxx ).should == false
    letter.respond_to?( :to_s ).should == true
  end
end
