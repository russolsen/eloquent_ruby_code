require '../utils/rspec_utils'
require '../code/doc3'

class FormLetter < Document                 ##(main
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
end                                        ##main)


describe 'Form letter with method missing' do
  it "should know how to replace anything" do
    fl = FormLetter.new( "form", "russ", "AGE SEX" )
    fl.replace_age( '99' )
    fl.replace_sex( 'male' )
    fl.content.should == '99 male'
  end


  it 'should blow up on name conflict' do
    begin
      letter = FormLetter.new( 'Example', 'Acme', 'The word is WORD' ) ##(bang
      letter.replace_word( 'Abracadabra' )                                ##bang)
      fail("didn't throw exception")

    rescue
      File.write( 'conflict.txt', $!.inspect )
    end
    
  end

end
