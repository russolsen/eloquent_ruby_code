require '../utils/rspec_utils'
require '../code/doc3'

class FormLetter < Document                        ##(form_letter
  def replace_word( old_word, new_word ) 
    @content.gsub!( old_word, "#{new_word}" ) 
  end 
end                                               ##form_letter)

describe FormLetter do
  it "should know how to replace words" do
    fl = FormLetter.new( "form", "russ", "Dear NAME" )
    fl.replace_word( 'NAME', 'Fred' )
    fl.content.should(match(/Fred/))
  end

  it "should have a good example of using form letters" do

    offer_letter = FormLetter.new( "Special Offer", "Acme Inc", ##(example
    %q{ 
        Dear Mr. LASTNAME 
    
        Are you troubled by the heartache of hangnails?
        ...
    
        FIRSTNAME, we look forward to hearing from you. 
    })
    
    offer_letter.replace_word( 'FIRSTNAME', 'Russ' ) 
    offer_letter.replace_word( 'LASTNAME', 'Olsen' )       ##example)

    offer_letter.content.should match( /Russ/ )
    offer_letter.content.should match( /Olsen/ )
  end
end

